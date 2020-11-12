class OutcropsController < ApplicationController

    def index
        signed_in_redirect

        @outcrops = Outcrop.all
        @user_outcrops = current_user.outcrops.all
    end

    def show
        signed_in_redirect

        @outcrop = Outcrop.find_by_id(params[:id])
        @outcrop_user = User.find_by_id(@outcrop.user_id)
        @outcrop_project = Project.find_by_id(@outcrop.project_id)
    end

    def new 
        signed_in_redirect

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

        if !@outcrop.valid?
            @outcrop.errors.messages
            flash.alert = "Fill in all Fields"
            render 'new'
        else 
            @outcrop.save
            redirect_to outcrop_path(@outcrop), notice: "Outcrop Created"
        end
    end

    def edit
        signed_in_redirect
        @outcrop = Outcrop.find_by_id(params[:id])
        not_current_user_redirect
    end

    def update
        @outcrop = Outcrop.find_by_id(params[:id])

        if outcrop_params.values.include?("")
            redirect_to edit_outcrop_path(@outcrop), notice: "Fill all Fields"
        else
            @outcrop.update(outcrop_params)
            redirect_to outcrop_path(@outcrop), notice: "Outcrop Updated"
        end
    end

    def destroy
        binding.pry
        @outcrop = Outcrop.find_by_id(params[:id])
        @outcrop.destroy

        redirect_to outcrops_path
    end

    private

    def outcrop_params
        params.require(:outcrop).permit(:location, :description, :longitude, :latitude, :user_id, :project_id)
    end

end