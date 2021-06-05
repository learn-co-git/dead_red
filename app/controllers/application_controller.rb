class ApplicationController < ActionController::API
  include ::ActionController::Cookies
    def current_user
      @user = User.find(session[:id])
      user_data = UserSerializer.new(@user).serializable_hash.to_json
      render json: user_data
    end

    def logged_in?
      !!current_user
    end

end
