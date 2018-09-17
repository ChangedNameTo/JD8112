class UserRolesController < ApplicationController
  before_action :authorize_action

  def new
    @user_role = UserRole.new
  end

  def index
    @user_roles = UserRole.all.order(role_id: :asc)
  end

  def show
    @user = User.find(params[:id])
    @user_roles = policy_scope(@user.user_roles)
  end

  def create
    UserRole.create(user_id: user, role_id: role)
  end

  def delete
    @user_role = UserRole.find(params[:id])

    authorize @user_role

    @user_role.delete

    redirect_to :back
  end

  private

  def authorize_action
    authorize UserRole
  end

  def user_role_params
    params.require(:user_role).permit(
      :user_id,
      :role_id
    )
  end
end
