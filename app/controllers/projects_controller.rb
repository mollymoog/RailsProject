class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def show
        binding.pry
        @project = Project.find_by_id(params[:id])
        
        # @project_outcrops = 
    end

    def new
        @outcrops = Outcrop.all
        @project = Project.new

    end

    def create
        binding.pry
        @outcrops = Outcrop.all

        @project = Project.new(project_params)

        if @project.save
            redirect_to project_path(@project)
        else
            render 'new'
        end
    end

    def edit 
        @project = Project.find_by_id(params[:id])
    end





    private
    def project_params
        params.require(:project).permit(:name, :description)
    end

end