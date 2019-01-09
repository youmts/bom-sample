json.array!(@nodes) do |node|
  json.extract! node, :id, :name, :sort_order
  json.url node_url(node, format: :json)
end