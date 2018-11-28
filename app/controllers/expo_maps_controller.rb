class ExpoMapsController < ApplicationController
  before_action :authorize_action

  def new
    @expo_map = ExpoMap.new
  end

  def index
    @expo_map = ExpoMap.first
  end

  def edit
    @expo_map = ExpoMap.first
    authorize @expo_map
  end

  def update
    @expo_map = ExpoMap.find(params[:id])

    authorize @expo_map
    @expo_map.update(expo_map_params)
    redirect_to controller: 'expo_maps', action: 'index'
  end

  def create
    @expo_map = ExpoMap.new(expo_map_params)

    @expo_map.save
    redirect_to controller: 'expo_maps', action: 'index'
  end

  private

  def authorize_action
    authorize ExpoMap
  end

  def expo_map_params
    params.require(:expo_map).permit(
      :image
    )
  end
end