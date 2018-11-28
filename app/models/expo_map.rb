# == Schema Information
#
# Table name: expo_maps
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExpoMap < ApplicationRecord
  mount_uploader :image, ExpoMapUploader

  validates :image,
    presence: true

end
