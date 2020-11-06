class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find_by_id(params[:id])
    end

    def new
        @project = Project.new(project_params)
    end

    def create
        @project = Project.new(project_params)

        if @project.save
            redirect_to project_path(@project)
        else
            render 'new'
        end
    end




    private
    def project_params
        params.require(:project).permit(:name, :description)
    end

end