require 'rails_helper'

RSpec.feature "Boms", type: :feature do
  before do
    @root = create(:root, name: "root_node_name")
    @child = @root.children.create(name: "child_node_name")
    @gchild = @child.children.create(name: "grand_child_node_name")
  end

  xscenario "select root nodes, show bom", js: true do
    visit root_path

    expect(page).to have_content @root.name
    expect(page).not_to have_content @child.name
    expect(page).not_to have_content @gchild.name

    expect(page).to have_content 'show'
    li = find("#app #list").find(@root.name)

    expect(page).to have_content @child.name
    expect(page).to have_content @gchild.name
  end
end
