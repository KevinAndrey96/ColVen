json.extract! client, :id, :document, :name, :email, :city, :address, :phone, :created_at, :updated_at
json.url client_url(client, format: :json)
