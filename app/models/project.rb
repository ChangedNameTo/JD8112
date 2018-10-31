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

class Project < ApplicationRecord
  # Associations
  has_many :project_members, dependent: :destroy
  has_many :project_comments, dependent: :destroy
  has_many :project_votes, dependent: :destroy

  # Validations
  validates :id, presence: true, uniqueness: :true,
    length: { minimum: 4, maximum: 4 },
    format: { with: /\d/i, message: "not a valid team id" }

  validates :name, presence: true, uniqueness: true,
    length: { minimum: 1 }

  validates :team, presence: true

  validates :description,
    presence: true,
    length: { maximum: 500 }

  validates :repo_link,
    format: { with: /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9]\.[^\s]{2,})/i,
              message: "not a valid URL" }

  # Helpers
  def project_name
    "#{name}"
  end
end
