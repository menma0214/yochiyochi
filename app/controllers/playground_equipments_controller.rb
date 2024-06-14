class PlaygroundEquipmentsController < ApplicationController
  skip_before_action :require_login
  def index
    @facility = Facility.find(params[:facility_id])
    @playground_equipments = @facility.playground_equipments
  end

  def show
    @playground_equipment = PlaygroundEquipment.find(params[:id])
  end
end
