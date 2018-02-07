module ApplicationHelper
  def login_helper(style = "")
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

  def nav_helper(style, tag_type)
links=<<NAV
  <#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
  <#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolio</a></#{tag_type}>
  <#{tag_type}><a href="#{blog_posts_path}" class="#{style} #{active? blog_posts_path}">Blog</a></#{tag_type}>
  <#{tag_type}><a href="#{bookshop_books_path}" class="#{style} #{active? bookshop_books_path}">Books</a></#{tag_type}>
  <#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
NAV
    links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end
