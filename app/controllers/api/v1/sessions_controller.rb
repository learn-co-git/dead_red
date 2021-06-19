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
      current = Sesh.all.last
      @user = User.find_by_id(current.user_id)
      if @user
        user_data = UserSerializer.new(@user).serializable_hash.to_json
        render json: {
          payload: @user
        }
      else
        render json: {
          error: "No Current User"
        }
      end
    end

    def destroy
      session.clear
      render json: {
        notice: "Logged Out"
      }
    end

private

    def session_params
      params.permit(:application, :username, :password)
    end

  end
