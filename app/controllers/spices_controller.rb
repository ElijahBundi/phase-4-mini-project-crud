class SpicesController < ApplicationController

    # GET /spices
    def index
        spices = Spice.all 
        render json: spices, status: :ok
    end

    # POST /spices
    def create
        spice = Spice.create(spice_params)
        if spice
            render json: spice, status: :created
        else
            render json: {error: "no spice found"}, status: :not_found
        end
    end

    # PATCH /spices/:id
    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    # DELETE /spices/:id
    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice 
            spice.destroy
            head :no_content
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
