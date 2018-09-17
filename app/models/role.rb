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
