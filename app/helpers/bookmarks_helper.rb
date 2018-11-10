module BookmarksHelper
  def bookmarkIcon(project, user_id)
    filled_star = favorite?(project.id, user_id) ? '' : 'outline'
    "<i class='yellow star #{filled_star} icon'></i>".html_safe
  end

  def favorite?(project_id, user_id)
    Bookmark.exists?(project_id: project_id, user_id: user_id)
  end
end