class Api::V1::VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]
  
    # GET /vehicles
    def index
      @vehicles = Vehicle.all
      render json: @vehicles
    end
  
    #GET /vehicles/1
    def show
      @vehicles = Vehicle.where(vehicle_id: params[:id])
      render json: { vehicle: @vehicle, reviews: @reviews }
    end
  
    #POST /vehicles
    def create
      @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        render json: @vehicle
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
    end
  
    #PATCH/PUT /vehicles/1
    def update
      if @vehicle.update(vehicle_params)
        render json: @vehicle
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
  
    end
  
    #DELETE /vehicles/1
    def destroy
      @vehicle.destroy
    end
  
    # Get our Amazon S3 Keys for image uploads
    def get_upload_credentials
      @accessKey = ENV['S3_ACCESS']
      @secretKey = ENV['S3_SECRET']
      render json: { accessKey: @accessKey, secretKey: @secretKey}
    end
  
    private
    # Methods we place in private can only be accessed by other methods on our vehicles controller
  
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
  
    def vehicle_params
      params.require(:vehicle).permit(:bodystyle, :year, :make, :model, :color, :mileage, :purchase_year, :condition, :image, :price)
    end
end
  