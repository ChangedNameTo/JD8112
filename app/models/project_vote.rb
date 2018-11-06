# == Schema Information
#
# Table name: project_votes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  project_id :integer          not null
#  yes        :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectVote < ApplicationRecord
  # Associations
  belongs_to :user, class_name: User, foreign_key: 'user_id'
  belongs_to :project, class_name: Project, foreign_key: 'project_id'

  # Validations
  validates :user_id,
    presence: true

  validates :project_id,
    presence: true

  validates :yes,
    presence: true

  # Helpers
  def full_name
    User.find(self.voter_id).full_name
  end
end
