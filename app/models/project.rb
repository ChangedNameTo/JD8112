# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  team        :string           not null
#  description :string           not null
#  client      :string           not null
#  repo_link   :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'csv'
class Project < ApplicationRecord
  # Associations
  has_many :project_members, dependent: :destroy
  has_many :project_comments, dependent: :destroy
  has_many :project_votes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # Validations
  validates :name,
    presence: true,
    uniqueness: true

  validates :description,
    presence: true

  def project_name
    "#{name}"
  end

  def vote_count
    project_votes.where(project_id: self.id).where(yes: true).count
  end

  def voted_by
    votes_for_project = project_votes.where(project_id: self.id).where(yes: true).pluck(:user_id)
  end

  def self.import_csv(file)
    CSV.foreach(file, quote_char: '"', col_sep: ',', row_sep: :auto, headers: true) do |row|
      team_number    = row[0]
      expo_session   = row[1]
      table_number   = row[2]
      project_name   = row[3]
      project_desc   = row[4]
      course_section = row[5]

      Project.create!(id:           team_number,
                      name:         project_name,
                      description:  project_desc,
                      client:       "client",
                      team:         "team",
                      repo_link:    "www.github.com")

    end
  end
end
