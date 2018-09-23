class ProjectsController < ApplicationController
  before_action :authorize_action

  def new
    @project = Project.new
  end

  def index
    @projects = Project.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @project = Project.create(project_params)

    if @project.save
      redirect_to :controller => 'home', :action => "logged_in"
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])

    authorize @project

    @project.delete

    redirect_to :back
  end

  private

  def authorize_action
    authorize Project
  end

  def project_params
    params.require(:project).permit(
      :project_id,
      :name,
      :team,
      :description,
      :client,
      :repo_link
    )
  end
end
