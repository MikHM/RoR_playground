module ApplicationHelper
  def login_helper(style)
    if current_user.is_a?(GuestUser)
      (link_to "Login", new_user_session_path, { :class => style}) + 
      " ".html_safe +
      (link_to "Register", new_user_registration_path, { :class => style})
    else
      # TODO: link returns: No route matches [GET] "/logout"
      (link_to "Logout", destroy_user_session_path, :class => style, method: :delete)
    end
  end

  def source_helper(layout)
    # TODO: Why is this showing up in templates even if "session[:source]" is not provided in the url??"
    if session[:source]
      greeting = "Thanks for visiting from #{session[:source]} and you are on #{layout}."
      content_tag(:p, greeting, class: "source-greeting")
    end
  end
end
