class ProjectsController < ApplicationController
  before_action :authorize_action

  def new
    @project = Project.new
  end

  def index
    @projects = Projecy.all.order(project_id: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @project = Project.create(project_params)

    if @@project = project.save
      redirect_to action: "index"
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
      :description,
      :client,
      :repo_link
    )
  end
end