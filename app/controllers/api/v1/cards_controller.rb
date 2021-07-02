class Api::V1::CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]


def index
  @cards = Card.all

  render json: @cards
end


def show
  render json: Cards.all
end


def create
  @card = Card.new(card_params)

  Cloudinary::Uploader(card_params[:url], :upload_preset => 'b33rch33s3', :folder => session[:id])

  if @card.save
    render json: @card, status: :created, location: @card
  else
    render json: @card.errors, status: :unprocessable_entity
  end
end


def update
  if @card.update(card_params)
    render json: @card
  else
    render json: @card.errors, status: :unprocessable_entity
  end
end

def destroy
  @card.destroy
end

def collection
  user = Sesh.all.last.user_id
  @user = User.find_by_id(user)
  render json: @user.cards
end


private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:player_name, :year, :brand, :description, :price, :bid, :bidderId, :url, :user_id)
  end
end
