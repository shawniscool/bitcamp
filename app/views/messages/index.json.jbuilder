json.array!(@messages) do |message|
  json.extract! message, :id, :name, :phone_number, :address, :city, :state, :content
  json.url message_url(message, format: :json)
end
