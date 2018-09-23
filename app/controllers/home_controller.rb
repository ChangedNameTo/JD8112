class HomeController < ApplicationController
  def logged_in
    skip_authorization

    unless current_user
      redirect_to authenticate_path
    end

    @projects = Project.all.order(id: :asc)
  end

  def logged_out
    skip_authorization
  end
end
