class BookmarksController < ApplicationController
  before_action :authorize_action

  def index
    @projects = Project.joins(:bookmarks).where(bookmarks: {user_id: session[:user_id]})
  end

  def bookmark
    if Bookmark.where(bookmark_params).destroy_all.empty?
      @bookmark = Bookmark.create(bookmark_params)
      @bookmark.save
    end
  end

  private

  def authorize_action
    authorize Bookmark
  end

  def bookmark_params
    params.require(:id)
    params.require(:user_id)
    params.permit(
      :user_id,
      :project_id
    )
  end
end