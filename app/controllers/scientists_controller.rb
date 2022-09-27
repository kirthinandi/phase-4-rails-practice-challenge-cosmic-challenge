class ScientistsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response

    def index 
        render json: Scientist.all, status: :ok
    end

    def show
        scientist = find_scientist
        render json: scientist, serializer: ScientistWithPlanetsSerializer
    end

    def create 
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update 
        scientist = find_scientist
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted 
    end

    def destroy
        scientist = find_scientist
        scientist.destroy
    end

    private 

    def render_record_not_found_response
        render json: {error: "Scientist not found"}, status: :not_found
    end

    def find_scientist
        Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end
