json.array!(@miners) do |miner|
  json.extract! miner, :id, :email
  json.url miner_url(miner, format: :json)
end
