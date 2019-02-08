json.extract! node, :id, :name, :sort_order
json.url node_url(node, format: :json)
json.children children do |key, value|
  json.partial! partial: 'node', locals: { node: key, children: value}
end
