require 'rails_helper'

RSpec.describe NodesController, type: :request do
  describe 'GET #index' do
    context 'rootが存在する場合' do
      before do
        @root = create(:root)
        @child = @root.children.create(name: 'child')
      end

      it '一覧情報を取得できること' do
        get nodes_path(format: :json)
        expect(response.status).to eq 200

        json = JSON.parse(response.body)
        expect(json.size).to eq 2
        expect(json[0]["id"]).to eq @root.id
        expect(json[1]["id"]).to eq @child.id
      end
    end
  end

  describe 'GET #show' do
    context 'treeが存在する場合' do
      before do
        @root = create(:root)
        @child = @root.children.create(name: 'child')
        @grandchild = @child.children.create(name: 'grandchild')
      end

      it 'treeを取得できること' do
        get node_path(@root, format: :json)
        expect(response.status).to eq 200

        json = JSON.parse(response.body)
        expect(json["id"]).to eq @root.id
        expect(json["url"]).to eq node_url(@root, format: :json)

        expect(json["children"][0]["id"]).to eq @child.id
        expect(json["children"][0]["url"]).to eq node_url(@child, format: :json)

        expect(json["children"][0]["children"][0]["id"]).to eq @grandchild.id
      end
    end
  end
end