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

          registration_ids= 'e8Jj5NhUS7CoVjAntxLHJL:APA91bHMuDQBoIL0tnBjHuhJsejh85rJ4r59_1nXSetbYidxVPEUuSbIfYOWlqk3xGopD1vJCqpwEFnrqq2J3GNDEqYb1uSWvhsMiXK-K3XnsLR5W-GByEJjLFBhuI6Ar-pDSTGeIISF'

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
      params.permit(:id, :placa, :cedula, :fecha, :nombre, :zona_parqueo)
    end

end
