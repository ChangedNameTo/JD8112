# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string           not null
#  last_name        :string           not null
#  phone_number     :string
#  image            :string
#  enabled          :boolean          default(FALSE), not null
#  email_address    :string           not null
#  provider         :string           not null
#  uid              :string           not null
#  oauth_token      :string           not null
#  oauth_expires_at :datetime         not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ApplicationRecord
  # Validation
  validates :first_name, presence: true,
    length: { minimum: 1 }

  validates :last_name, presence: true,
    length: { minimum: 1 }

  validates :email_address, presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Not a valid email address" }

  validates :provider, presence: true

  validates :uid, presence: true,
    uniqueness: {
      case_sensitive: false,
      scope: :provider,
      message: "UIDs must be unique"
  }

	validates :oauth_token,
    presence: true

  validates :oauth_expires_at,
    presence: true

  # Helpers
  def full_name
    "#{first_name} #{last_name}"
  end

  def has_role?(roles)
    roles.each do |role|
      if self.roles.include? role
        return true
      end
    end

    false
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email_address = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.image = auth.info.image
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
