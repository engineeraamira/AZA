json.extract! user, :id, :name, :email, :phone, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
