# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  project_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bookmark < ApplicationRecord
  # Associations
  belongs_to :user, class_name: User, foreign_key: 'user_id'
  belongs_to :project, class_name: Project, foreign_key: 'project_id'

  validates :user_id,
    presence: true

  validates :project_id,
    presence: true,
    uniqueness: {
      scope: :user,
      message: "Two same bookmarks for same user"
    }

  # Helpers
  def full_name
    User.find(self.user_id).full_name
  end

  def project_name
    Project.find(self.project_id).name
  end
end
