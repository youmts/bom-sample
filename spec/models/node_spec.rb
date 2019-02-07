# == Schema Information
#
# Table name: nodes
#
#  id         :integer          not null, primary key
#  name       :string
#  sort_order :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Node, type: :model do
  before do
    @root = create(:root)
  end

  it "rootが存在すること" do
    expect(@root.name).to eq "root"
  end

  it "childが登録できること" do
    expect {
      @root.children.create(name:  "child")
    }.to change(@root.children, :length).by(1)
  end

  it "childがsort_orderの順序で並ぶこと" do
    @root.children.create(name: "child1", sort_order: "1")
    @root.children.create(name: "child0", sort_order: "0")

    expect(@root.children[0].name).to eq "child0"
    expect(@root.children[1].name).to eq "child1"
  end
end
