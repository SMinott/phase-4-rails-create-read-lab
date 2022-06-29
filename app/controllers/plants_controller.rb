class PlantsController < ApplicationController
    def index
        render json: Plant.all
    end

    def show
        plants = Plant.find_by(id: params[:id])
        if plants
            render json: plants
        else
            render json: {error: 'Plant not found'}, status: :not_found
        end
    end

    def create
        new_plant = Plant.create(params.permit(:name, :image, :price))
        render json: new_plant, status: :created
    end
end
