class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def index
        @profile = current_user.profile
    end

    def show
        @profile = Profile.find_by(:id=> params[:id])
    end

    def new
        @profile = Profile.new
    end
    
    def edit
        @profile = Profile.find_by(:id=> params[:id])
    end

    def create
        @profile = Profile.new(profile_params)
        @profile.user_id = current_user.id
        if @profile.save
            redirect_to profile_path(@profile), success: "Profile is successfully created."
        else
            render action: :new, error: "Error while creating new profile"
        end
    end

    def update
        @profile = Profile.find_by(:id=> params[:id])
        if @profile.update(profile_params)
            flash[:success] = "Profile #{@profile.first_name} is successfully updated."
            redirect_to profile_path(@profile)
        else
            flash[:error] = "Error while updating story"
            redirect_to profile_path(@profile)
        end
    end

    def destroy
        if @profile.destroy
            flash[:success] = "Profile #{@profile.first_name} removed successfully"
            redirect_to profiles_path
        else
            flash[:error] = "Error while removing story!"
            redirect_to profile_path(@profile)
        end 
    end

    private
    def profile_params
        params.require(:profile).permit(:first_name, :last_name)
    end
end