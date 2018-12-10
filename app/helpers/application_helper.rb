module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title }
  end

  def meta_description(page_meta_description)
    content_for(:meta_description) { page_meta_description }
  end

  def heading(page_heading)
    content_for(:heading) { page_heading }
  end

  def pclass(page_pclass)
    content_for(:pclass) { page_pclass }
  end

  def app_title
    ENV['COMPOSE_PROJECT_NAME'].sub('_', ' ').titleize
  end

  def humanize_boolean(input)
    input ||= ''
    case input.to_s.downcase
    when 't', 'true'
      'Yes'
    else
      'No'
    end
  end

  def css_for_boolean(input)
    if input
      'success'
    else
      'danger'
    end
  end

  def active_class?(link_path)
    return 'active' if request.path == link_path
    ''
  end
end
