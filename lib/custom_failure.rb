class CustomFailure < Devise::FailureApp
  def redirect_url
    root_path
  end

  def respond
    if http_auth?
      http_auth
    else
      flash[:alert] = "Invalid email or password."
      redirect
    end
  end
end
