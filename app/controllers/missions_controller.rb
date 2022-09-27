class MissionsController < ApplicationController

    def create
        mission = Mission.create!(params.permit(:name, :scientist_id, :planet_id))
        render json: mission.planet, status: :created
    end

    
end
