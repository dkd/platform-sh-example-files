json.array!(@magics) do |magic|
  json.extract! magic, :id, :spell
  json.url magic_url(magic, format: :json)
end
