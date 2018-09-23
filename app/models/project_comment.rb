# == Schema Information
#
# Table name: project_comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  project_id :integer          not null
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectComment < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :project

  # Validations
  validates :author_id,
    presence: true

  validates :project_id,
    presence: true

  # Helpers
  def full_name
    User.find(self.author_id).full_name
  end

  def project_name
    Project.find(self.project_id).name
  end
end
