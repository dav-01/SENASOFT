class ParkingController < ApplicationController


  skip_before_action :verify_authenticity_token

  def index
    @parkings = Parking.all
    respond_to do |format|
     format.html { }
     format.json { render json: @parkings }
   end

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

          require 'fcm'

          fcm = FCM.new('AAAAVWV_sf4:APA91bF6LSzImSCSB_ACztu7KK1-nmiq5RmD2y-CaPvvNUcL1HyGG-jCyptTPVmPTu7qyvku4U8L_KQjcMDkyIpPjEflrLAjGn-poNuq7SEGujs1qOYo7DT0WXbeiPk9wsYJYcgDkvAW') # Find server_key on: your firebase console on web > tab general > web api key

          registration_ids= ' fP-v2FDWT2WH18jbL-KNYp:APA91bGyJbOzDHtX2f5NHr-l8xRGBSQJYNIfrRcTK0_k562gavmhDwfVxCUOTDhjb9akNURaQxFiymJnG9ax27MZtFqPgjomUIL41N1G-3oQEayyN97HSMa8GaveZqJ8Nz6Fr85Ldcz3'

          options = {
                  priority: "high",
                  collapse_key: "updated_score",
                  notification: {
                      title: "Gracias por su registro #{@parking.nombre}",
                      body: "Su zona de parqueo asignada es: #{@parking.zona_parqueo}"}
                  }

          response = fcm.send(registration_ids, options)
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
      params.require(:parking).permit(:id, :placa, :cedula, :fecha, :nombre, :zona_parqueo)
    end

end
