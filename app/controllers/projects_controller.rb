class ProjectsController < ApplicationController

    def index
        signed_in_redirect

        @projects = Project.all.alpha
        @most_users = Project.project_users
        binding.pry
    end

    def show
        binding.pry
        signed_in_redirect
        @project = Project.find_by_id(params[:id])
        contributor?

    end

    def new
        signed_in_redirect

        @outcrops = Outcrop.all
        @project = Project.new

    end

    def create

        @outcrops = Outcrop.all

        @project = Project.new(project_params)
        @project.user_id = current_user.id

# if select outcrop from dropdown, @project.outcrops << outcrop
#undefined method `each' for "Log Lady's Cabin":String [ error when saving prj and redirect to show ]

        if @project.save
            redirect_to project_path(@project)
        else
            render 'new'
        end
    end

    def edit 
        signed_in_redirect
        @outcrops = Outcrop.all
        @project = Project.find_by_id(params[:id])
        not_contributor_redirect

    end

    def update
        @outcrops = Outcrop.all
        @project = Project.find_by_id(params[:id])

        if project_params.values.include?("")
            redirect_to edit_project_path(@project), notice: "Fill all Fields"
        else
            @project.update(project_params)
            redirect_to project_path(@project), notice: "Project Updated"
        end

    end

    def destroy
        @project = Project.find_by_id(params[:id])
        @project.destroy

        redirect_to projects_path
    end


    private
    def project_params
        params.require(:project).permit(:name, :description, :outcrops, :user_id)
    end

    def outcrops

    end

    def not_contributor_redirect
        contributor_ids = @project.users.collect {|u| u.id}

        if !contributor_ids.include?(current_user.id)
            redirect_to projects_path, notice: "Not your project"
        end
    end

    def contributor?
        contributor_ids = @project.users.collect {|u| u.id}
        if contributor_ids.include?(current_user.id)
            @contributor = true
        end
    end
end