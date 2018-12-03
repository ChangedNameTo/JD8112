class UsersController < ApplicationController
  # before_action :authorize_action,
  #   only: [:index, :show, :new, :create, :organization_disable, :organization_enable]

  helper_method :remove_visitors

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
    @user = User.find(params[:id])

    authorize @user

    @user.delete

    redirect_to user_path
  end

  def remove_visitors
    sql = 'select * from users 
            where id not in (select user_id
                             from user_roles);'
    @visitors = User.find_by_sql(sql)
    
    # TODO: delete visitors
  end


  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email_address,
                                 :phone_number,
                                 :affiliated_organization,
                                 :big,
                                 :image,
                                 :number,
                                 :pledge_class_id,
                                 :current_status_id
                                )
  end

  # def authorize_action
  #   authorize User
  # end
end
