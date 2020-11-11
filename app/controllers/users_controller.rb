class UsersController < ApplicationController

    def show
        binding.pry
        @user = User.find_by_id(current_user.id)
        @projects = @user.projects
        @outcrops = @user.outcrops
    end

end