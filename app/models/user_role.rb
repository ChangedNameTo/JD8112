# == Schema Information
#
# Table name: user_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  role_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserRole < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :role

  # Validations
  validates :user,
    presence: true

  validates :role,
    presence: true,
    uniqueness: {
      scope: :user,
      message: "Duplicate roles are not allowed"
    }

  # Helpers
  def full_name
    User.find(self.user_id).full_name
  end

  def role_label
    Role.find(self.role_id).label
  end
end
