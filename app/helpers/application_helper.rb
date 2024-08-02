module ApplicationHelper

  def page_title(title = '', admin: false)
    base_title = admin ? 'よちよち(管理画面)' : 'よちよち'
    title.present? ? "#{title} | #{base_title}" : base_title
  end

end
