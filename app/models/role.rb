# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  label       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
  # Associations
  has_many :user_roles
  has_many :users, through: :user_roles

  # Validations
  validates :label,
    presence: true

  validates :description,
    presence: true

  def label_string
    "#{label}"
  end
end
