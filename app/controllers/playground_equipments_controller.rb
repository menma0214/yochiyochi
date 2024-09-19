class PlaygroundEquipmentsController < ApplicationController
  skip_before_action :require_login
  def index
    @facility = Facility.find(params[:facility_id])
    @playground_equipments = @facility.playground_equipments.page(params[:page]).per(5)
  end

  def show
    @playground_equipment = PlaygroundEquipment.find(params[:id])
    @facility = @playground_equipment.facility
    set_meta_tags(
      title: @playground_equipment.title,
      keywords: "#{@playground_equipment.kind},#{@playground_equipment.target_age},#{@playground_equipment.remarks}"
    )
  end
end
