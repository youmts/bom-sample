class NodesController < ApplicationController
  def index
    @nodes = Node.all
    respond_to do |format|
      format.json # app/views/nodes/index.json.jbuilder
    end
  end
end
