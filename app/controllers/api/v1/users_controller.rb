class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

def index
  @users = User.all

  render json: @users
end

def show
  user_data = UserSerializer.new(@user).serializable_hash.to_json
  render json: user_data
end

def create
end

def make_new
  @user = User.new(username: params[:username], email: params[:email], rating: "5 star", password: params[:password])
  @user.save

  if @user.save
    @sesh = Sesh.new(user_id: @user.id, logged_in: true)
    @sesh.save
    if @sesh.save
    render json: {
      id: @user.id,
      username: @user.username,
      email: @user.email,
      rating: @user.rating
    }
    else
    render json: { notice: "error in sesh creation" }, status: :unprocessable_entity
    end
  else
    render json: {
      notice: "error in user creation"
    }
  end
end

def update
  if @user.update()
    render json: @user
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

def destroy
  @user.destroy
end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
