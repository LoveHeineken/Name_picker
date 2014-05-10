json.array!(@companies) do |company|
  json.extract! company, :name, :adress
  json.url company_url(company, format: :json)
end
