class ProjectsController < ApplicationController
  before_action :authorize_action,
    only: [:index, :show, :new, :create, :voting_pdf]

  def new
    @project = Project.new
  end

  def index
    @projects = Project.all.order(id: :asc)
  end

  def edit
    @project = Project.find(params[:id])

    authorize @project
  end

  def update
		@project = Project.find(params[:id])

    authorize @project

		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

  def show
    @project          = Project.find(params[:id])
    @members          = ProjectMember.where(project_id: @project.id)
    @project_comments = ProjectComment.where(project_id: @project.id)
    @project_comment  = @project.project_comments.build(user: current_user)
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

  def voting_pdf
    @projects = Project.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Project Voting Report",
        template: "pdfs/project_voting.html.erb",
        layout: "pdf.html",
        page_size: "Letter"
      end
    end
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

  def project_comment_params
    params.require(:project_comment).permit(
      :author_id,
      :project_id,
      :body
    )
  end
end
