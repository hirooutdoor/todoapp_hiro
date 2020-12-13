class ProfilesController < ApplicationController

    before_action :authenticate_user!

    def show
        @profile = current_user.profile
        # has_one: profileだからprofileでok
    end

    def edit
    end

end
