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
  @card = Card.new(player_name: card_params[:player_name], year: card_params[:year], brand: card_params[:brand], description: card_params[:description], price: card_params[:price], url: card_params[:url], user_id: params[:user], sold_status: false)
  @card.save

  if @card.save
    render json: @card, status: :created, location: @card
  else
    render json: @card.errors, status: :unprocessable_entity
  end
end

def update
  if @card.update(bidderId: buy_params[:user], sold_status: true)
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

  def buy_params
    params.permit(:id, :user, :card)
  end

  def card_params
    params.require(:card).permit(:player_name, :year, :brand, :description, :price, :bid, :bidderId, :url, :user, :sold_status)
  end
end
