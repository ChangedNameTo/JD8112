class ProjectVotesController < ApplicationController
  before_action :authorize_action

  def new
    @project_vote = ProjectVote.new
  end

  def index
    @project_votes = ProjectVote.all.order(voter_id: :asc)
  end

  def show
    @user = ProjectVote.find(params[:id])
  end

  def create
    @project_vote = ProjectVote.create(project_vote_params)

    if @project_vote.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def destroy
    @project_vote = ProjectVote.find(params[:id])

    authorize @project_vote

    @project_vote.delete

    redirect_to :back
  end

  private

  def authorize_action
    authorize ProjectVote
  end

  def project_vote_params
    params.require(:project_vote).permit(
      :voter_id,
      :project_id,
      :yes
    )
  end
end
