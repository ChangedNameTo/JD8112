module ExpoDefaultSettings
  settings_list = [
    {
      voting_enabled: false
    }
  ]
  settings_list.each do |settings|
    ExpoSettings.find_or_create_by!(settings)
  end
end
