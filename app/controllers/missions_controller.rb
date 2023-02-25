class MissionsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
  
  def create
    mission = Mission.create!(mission_params)
    render json: mission.planet, status: :created
  end

  private

  def mission_params
    params.permit(:name, :scientist_id, :planet_id)
  end

  def render_record_invalid(e)
    render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
  end

end
