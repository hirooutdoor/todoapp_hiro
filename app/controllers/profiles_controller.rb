class ProfilesController < ApplicationController

    before_action :authenticate_user!

    def show
        @profile = current_user.profile
        # has_one: profileだからprofileでok
    end

    def edit
        @profile = current_user.build_profile
        #has_oneの場合の書き方
    end

end
