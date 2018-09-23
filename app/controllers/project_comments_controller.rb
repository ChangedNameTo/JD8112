class ProjectCommentsController < ApplicationController
  before_action :authorize_action

  def new
    @project_comment = ProjectComment.new
  end

  def edit
    @project_comment = ProjectComment.find(params[:id])

    authorize @project_comment
  end

  def create
    @project_comment = ProjectComment.create(project_comment_params)

    if @project_comment.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def destroy
    @project_comment = ProjectComment.find(params[:id])

    authorize @project_comment

    @project_comment.delete

    redirect_to :back
  end

  private

  def authorize_action
    authorize ProjectComment
  end

  def project_comment_params
    params.require(:project_comment).permit(
      :author_id,
      :project_id,
      :body
    )
  end
end
