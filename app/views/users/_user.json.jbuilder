json.extract! user, :id, :email, :password, :username
json.url user_url(user, format: :json)
