class Api::V1::SessionsController < ApplicationController
  include ::ActionController::Cookies

  def create
    @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        @sesh = Sesh.new(user_id: @user.id, logged_in: true)
        @sesh.save
      user_data = UserSerializer.new(@user).serializable_hash.to_json
      render json: {
        payload: @user
      }
       else
        render json: {
          error: "Did not create"
        }
        end
      end

    def get_current_user
                          #This will not work but a temp fix, Sesh,
                          # is my 'sessions' for postgres
      @current = Sesh.all.last
      @user = User.find_by_id(@current.user_id)
      if @current.logged_in == true
        user_data = UserSerializer.new(@user).serializable_hash.to_json
        render json: {
          payload: @user
        }
      else
        render json: {
          notice: "No Current User"
        }
      end
    end

    def destroy
      if params[:user] == nil
        render json: {
          notice: "Logged Out"
        }
      else
      @user = User.find_by_id(params[:user])
      @currentSesh = @user.seshs.last
      @currentSesh.logged_in = false

      if @currentSesh.save
      render json: {
        notice: "Logged Out"
      } else
      render json: {
        notice: "Log Out Failed"
      }
        end
      end
    end

private

    def session_params
      params.permit(:application, :username, :password)
    end

  end
