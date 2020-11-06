class OutcropsController < ApplicationController

    def index
        @outcrops = Outcrop.all
        @user_outcrops = current_user.outcrops.all
    end

    def show
        @outcrop = Outcrop.find_by_id(params[:id])
        @outcrop_user = User.find_by_id(@outcrop.user_id)
        @outcrop_project = Project.find_by_id(@outcrop.project_id)
    end

    def new 
        @outcrop = Outcrop.new
    end

    def create
        @outcrop = Outcrop.new(outcrop_params)
        if @outcrop.save
            redirect_to outcrop_path(@outcrop)
        else 
            render 'new'
        end
    end

    def edit
        if !user_signed_in?
            redirect_to new_user_session_path
        end
            @outcrop = Outcrop.find_by_id(params[:id])
    end

    def update
        binding.pry
        @outcrop = Outcrop.find_by_id(params[:id])

        @outcrop.update(outcrop_params)
        redirect_to outcrop_path(@outcrop)
    end

    private

    def outcrop_params
        params.require(:outcrop).permit(:location, :description, :longitude, :latitude, :user_id, :project_id)
    end

end