class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :rating, :id
end
