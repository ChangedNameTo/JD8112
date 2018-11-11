class ProjectVotesController < ApplicationController
  before_action :authorize_action

  def new
    @project_vote = ProjectVote.new
  end

  def index
    @project_votes = ProjectVote.all.order(user_id: :asc)
  end

  def show
    @project_vote = ProjectVote.find(params[:id])
  end

  def create
    # If user has already voted, then update this vote with
    # the new project id. Else, create a new vote.
    if ProjectVote.where(user_id: (params[:user_id])).any?()
      update
    else
      @project_vote = ProjectVote.create(project_vote_params)
      redirect_to :controller => 'home', :action => "logged_in"
    end
  end

  def update
    @project_vote = ProjectVote.where(user_id: params[:user_id]).limit(1)
    @project_vote.update(project_id: params[:project_id], yes: params[:yes])
    redirect_to :controller => 'home', :action => "logged_in"
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
    params.permit(
      :user_id,
      :project_id,
      :yes
    )
  end
end
