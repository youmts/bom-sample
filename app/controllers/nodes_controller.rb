class NodesController < ApplicationController
  def index
    @nodes = Node.roots.order(:id)
    respond_to do |format|
      format.json # app/views/nodes/index.json.jbuilder
    end
  end

  def show
    node = Node.find(params[:id])
    respond_to do |format|
      format.json {
        render json: direct_hash_tree(node) }
    end
  end

  private
    def direct_hash_tree(node)
      hash = node.hash_tree

      direct_hash_node(hash.keys[0], hash.values[0])
    end

    def direct_hash_node(k, v)
      {id: k.id, name: k.name, sort_order: k.sort_order, 
        children: direct_hash_children(v),
        url: node_url(k, format: :json)
      }
    end

    def direct_hash_children(hash)
      hash.map { |k, v|
        direct_hash_node(k, v)
      }
    end
end
