require 'rails_helper'

RSpec.feature "Boms", type: :feature do
  before do
    @root = create(:root, name: "root_node_name")
    @child = @root.children.create(name: "child_node_name")
    @gchild = @child.children.create(name: "grand_child_node_name")
  end

  scenario "select root nodes, show bom", js: true do
    visit root_path

    # rootのみ一覧に表示されること
    expect(page).to have_content @root.name
    expect(page).not_to have_content @child.name
    expect(page).not_to have_content @gchild.name

    # 一覧の行を選択する
    click_button('forward')

    # Treeのrootノード
    node = find('div#tree ul li')
    expect(node).to have_content @root.name

    # 子ノード
    node.find('div.tree-item-expander').click
    node = node.find('ul li')
    expect(node).to have_content @child.name

    # 孫ノード
    node.find('div.tree-item-expander').click
    node = node.find('ul li')
    expect(node).to have_content @gchild.name
  end
end
