class LocationsController < ApplicationController
    before_action :authenticate_user!

    def index
        # @addresses = Address.all
    end

    def show
        @location = Location.find_by(:id=> params[:id])
    end

    def new
        @location = Location.new
        @users = User.all
    end
    
    def edit
         @location = Location.find_by(:id=> params[:id])
         @users = User.all
    end

    def create
        @location = Location.new(location_params)
        @location.user_id = current_user.id
        @location.access_id = Access.first.id
        if @location.save
            if params["user_ids"]
                if !params["user_ids"].empty?
                    params["user_ids"].each do |id|
                        UserLocation.create(user_id: id, location_id:@location.id)
                    end
                else
                end
            end
            redirect_to location_path(@location), success: "Address is successfully created."
        else
            render action: :new, error: "Error while creating new address"
        end
    end

    def update
        @location = Location.find_by(:id=> params[:id])
        if @location.update(location_params)
            if !params["user_ids"].empty?
                params["user_ids"].each do |id|
                    UserLocation.create(user_id: id, location_id:@location.id)
                end
            else
            end
            flash[:success] = "Location is successfully updated."
            redirect_to location_path(@location)
        else
            flash[:error] = "Error while updating location"
            render :edit
        end
    end

    def destroy
        # if @address.destroy
        #     flash[:success] = "Profile #{@profile.first_name} removed successfully"
        #     redirect_to profiles_path
        # else
        #     flash[:error] = "Error while removing story!"
        #     redirect_to profile_path(@profile)
        # end 
    end

    private
    def location_params
        params.require(:location).permit(:latitude, :longitude, user_ids:[])
    end
end