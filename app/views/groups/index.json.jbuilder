json.array!(@groups) do |group|
  json.extract! group, :name, :adress
  json.url group_url(group, format: :json)
end
