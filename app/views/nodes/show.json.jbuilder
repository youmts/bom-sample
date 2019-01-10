json.extract! @node, :id, :name, :sort_order
json.url node_url(@node, format: :json)
json.children @node.children do |child|
  json.extract! child, :id, :name, :sort_order
  json.url node_url(child, format: :json)  
end
