class UsersController < ApplicationController
  before_action :authorize_action,
    only: [:index, :show, :new, :create, :update, :destroy, :destroy_all]

  def new
    @user = User.new
  end

  def edit
    @user = User.find( params[ :id ] )

    authorize @user
  end

  def create
		@user = User.new( user_params )

		if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

	def update
		@user = User.find(params[:id])

    authorize @user

		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).delete
  end

  def destroy_all
    sql = 'DELETE FROM users
            WHERE id NOT IN (SELECT user_id
                               FROM user_roles);'
    ActiveRecord::Base.connection.execute(sql)

    redirect_to expo_settings_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email_address,
                                 :phone_number,
                                 :image
                                )
  end

  def authorize_action
    authorize User
  end
end
