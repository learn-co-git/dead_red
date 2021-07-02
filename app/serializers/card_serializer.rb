class CardSerializer
  include JSONAPI::Serializer
  attributes :player_name, :year, :brand, :description, :price, :bid, :bidderId, :url, :user_id
end
