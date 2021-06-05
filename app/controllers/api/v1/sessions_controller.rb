class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      render json: {
        user: @user
      }
       else
        render json: {
          error: user.error
        }
        end
      end

    def get_current_user
      if logged_in?
        render json: current_user
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

    end
