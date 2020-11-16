class UsersController < ApplicationController
    before_action :signed_in_redirect
    def show
        @user = User.find_by_id(current_user.id)
        @projects = @user.projects.alpha
        @outcrops = @user.outcrops
    end


end