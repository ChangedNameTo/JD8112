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
  belongs_to :user, class_name: User, foreign_key: 'user_id'
  belongs_to :project, class_name: Project, foreign_key: 'project_id'

  # Validations
  validates :user_id,
    presence: true

  validates :project_id,
    presence: true

  validates :body,
    presence: true

  # Helpers
  def author_name
    User.find(self.user_id).full_name
  end

  def project_name
    Project.find(self.project_id).name
  end

  def author_image
    User.find(self.user_id).image
  end

  def post_date
    created_at.strftime("%m/%d/%Y")
  end
end
