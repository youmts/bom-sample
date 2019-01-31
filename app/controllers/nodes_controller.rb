class NodesController < ApplicationController
  def index
    @nodes = Node.roots.order(:id)
    respond_to do |format|
      format.json # app/views/nodes/index.json.jbuilder
    end
  end

  def show
    @node = Node.find(params[:id])
    respond_to do |format|
      format.json # app/views/nodes/show.json.jbuilder
    end
  end
end
