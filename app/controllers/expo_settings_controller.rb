class ExpoSettingsController < ApplicationController
  before_action :authorize_action

  def new
    @expo_settings = ExpoSettings.new
  end

  def index
    @expo_settings = ExpoSettings.first
  end

  def update
    @expo_settings = ExpoSettings.find(params[:id])

    authorize @expo_settings
    if @expo_settings.update(expo_settings_params)
      redirect_to action: "index", message: "Saved new settings, expo voting \r\n " + (@expo_settings.voting_enabled ? "enabled": "disabled")
    else
      redirect_to action: "index", message: "Failed to save settings"
    end
  end

  private

  def authorize_action
    authorize ExpoSettings
  end

  def expo_settings_params
    params.require(:expo_settings).permit(
      :expo_settings_id,
      :voting_enabled
    )
  end
end