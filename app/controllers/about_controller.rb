class AboutController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all
    end
    def my_share
        if current_user
            @mylocations = Location.where(user_id: current_user)
        end
    end

    def other_share_with_me
        if current_user
            @shared_locations = get_shared_locations
        end
    end

    private
    def get_shared_locations
        locations_array = []
        current_user.user_locations.each do |user_location|
            locations_array << user_location.location
        end
        return locations_array
    end
end