# == Schema Information
#
# Table name: project_votes
#
#  id         :integer          not null, primary key
#  voter_id   :integer          not null
#  project_id :integer          not null
#  yes        :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectVote < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :project

  # Validations
  validates :voter_id,
    presence: true

  validates :role_id,
    presence: true

  validates :yes,
    presence: true
  # Helpers
  def full_name
    User.find(self.voter_id).full_name
  end
end
