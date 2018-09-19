# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string           not null
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
  validates :name,
    presence: true,
    uniqueness: true

  validates :description,
    presence: true

  def label_string
    "#{name}"
  end
end