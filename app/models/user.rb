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
