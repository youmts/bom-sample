require 'rails_helper'

RSpec.describe NodesController, type: :request do
  describe 'GET #index' do
    context 'rootが存在する場合' do
      before do
        @root = create(:root)
      end

      it '一覧情報を取得できること' do
        get nodes_path(format: :json)
        expect(response.status).to eq 200

        json = JSON.parse(response.body)
        expect(json.size).to eq 1
        expect(json[0]["id"]).to eq @root.id
      end
    end
  end
end