json.array!(@groups) do |group|
  json.extract! group, :name, :address
  json.url group_url(group, format: :json)
end
