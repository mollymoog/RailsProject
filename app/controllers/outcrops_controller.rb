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
        if params[:project_id]
            @project = Project.find_by_id(params[:project_id])
            @outcrop = @project.outcrops.build
        else
            @outcrop = Outcrop.new
        end
    end

    def create
        if params[:project_id]
            @project = Project.find_by_id(params[:project_id])
            @outcrop = @project.outcrops.build(outcrop_params)
        else
            @outcrop = Outcrop.new(outcrop_params)
        end

        @outcrop.user_id = current_user.id

        if @outcrop.save
            redirect_to outcrop_path(@outcrop)
        else 
            render 'new'
        end
    end

    def edit
        signed_in_redirect

        @outcrop = Outcrop.find_by_id(params[:id])

        if current_user.id != @outcrop.user_id
            redirect_to outcrops_path
        end
    end

    def update
        @outcrop = Outcrop.find_by_id(params[:id])

        @outcrop.update(outcrop_params)
        redirect_to outcrop_path(@outcrop)
    end

    private

    def outcrop_params
        params.require(:outcrop).permit(:location, :description, :longitude, :latitude, :user_id, :project_id)
    end

end