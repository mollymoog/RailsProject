class ProjectsController < ApplicationController

    def index
        signed_in_redirect

        @projects = Project.all.alpha
        @most_users = Project.project_users
        @user_project = Project.find_by_id(@most_users.ids.first)
        if params[:search_name]
            @search_results = Project.all.name_search(params[:search_name])
        end

    end

    def show

        signed_in_redirect
        @project = Project.find_by_id(params[:id])
        contributor?

    end

    def new
        signed_in_redirect
        @project = Project.new

    end

    def create
        @project = Project.new(project_params)

        if @project.save
            redirect_to project_path(@project), notice: "Project Created"
        else
            render 'new', notice: "Project wasn't saved"
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
        params.require(:project).permit(:name, :description, :project_search, :user_ids, :outcrop_ids, outcrops_attributes: [:location, :description, :latitude, :longitude])
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