class ParkingController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @parkings = Parking.all
  end

  def show 
    @parking = Parking.find(params[:id])
  end 

  def create 
    @parking = Parking.new(parking_params)
    if @parking.save 
      render json: @parking
    else
      render :new
    end
  end

    def edit
      @parking = Parking.find(params[:id])
    end
  
    def update
      @parking = Parking.find(params[:id])
        if @parking.update(parking_params)
          redirect_to parking_index_path
        else
          render :edit
        end
    end
  
    def destroy
      @parking = Parking.find(params[:id])
      @parking.destroy
    end

    private

    def parking_params
      params.permit(:placa, :cedula, :fecha, :nombre, :zona_parqueo)
    end

end
