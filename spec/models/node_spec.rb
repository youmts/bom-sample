require 'rails_helper'

RSpec.describe Node, type: :model do
  it "rootが登録できること" do
    node = Node.create(
      name: "test",
      sort_order: "0",
    )
    expect(node.name).to eq "test"
  end

  it "childが登録できること" do
    root = Node.create(
      name: "root",
    )

    expect {
      root.children.create(name:  "child")
    }.to change(root.children, :length).by(1)
  end

  it "childがsort_orderの順序で並ぶこと" do
    root = Node.create(
      name: "root",
    )

    root.children.create(name: "child1", sort_order: "1")
    root.children.create(name: "child0", sort_order: "0")

    expect(root.children[0].name).to eq "child0"
    expect(root.children[1].name).to eq "child1"
  end
end