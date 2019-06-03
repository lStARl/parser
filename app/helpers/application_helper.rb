module ApplicationHelper
  def auth_links
    if user_signed_in?
      link_to("Logout(#{user_email})", destroy_user_session_path, method: :delete)
    else
      link_to('Sign In', new_user_session_path)
    end
  end

  def user_email
    current_user.email
  end
end
