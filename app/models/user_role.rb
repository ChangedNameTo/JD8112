class UserRole < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :role

  # Validations
  validates :user,
    presence: true

  validates :role,
    presence: true,
    uniqueness: {
      scope: :user,
      message: "Duplicate roles are not allowed"
    }
end
