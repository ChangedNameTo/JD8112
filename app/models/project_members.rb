# == Schema Information
#
# Table name: project_members
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  project_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectMember < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :project

  # Validations
  validates :user_id,
    presence: true

  validates :project_id,
    presence: true

  # Helpers
  def full_name
    User.find(self.user_id).full_name
  end

  def project_name
    Project.find(self.project_id).name
  end
end
