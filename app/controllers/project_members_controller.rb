class ProjectMembersController < ApplicationController
  before_action :authorize_action

  def new
    @project_member = ProjectMember.new
  end

  def index
    @project_members = ProjectMember.all.order(user_id: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @project_member = ProjectMember.create(project_member_params)

    if @project_member = project_member.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def destroy
    @project_member = ProjectMember.find(params[:id])

    authorize @project_member

    @project_member.delete

    redirect_to :back
  end

  private

  def authorize_action
    authorize ProjectMember
  end

  def project_member_params
    params.require(:project_member).permit(
      :user_id,
      :project_id
    )
  end
end