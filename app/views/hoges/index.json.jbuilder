json.array!(@hoges) do |hoge|
  json.extract! hoge, :suuji, :mojiretsu
  json.url hoge_url(hoge, format: :json)
end
