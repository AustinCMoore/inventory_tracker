require 'rails_helper'

RSpec.describe 'items create page' do
  it "has a form to create a new item" do
    visit "/items/new"
    expect(current_path).to eq("/items/new")

    expect(page).to have_content("Item name")
    expect(page).to have_button("Create Item")
  end

  it "routes to the index page upon successful submission, where the item is now listed" do
    item_a = Item.create!(name: 'Item A')
    visit "/items"

    expect(page).to have_content(item_a.name)
    expect(page).to_not have_content("Item B")

    visit "/items/new"

    fill_in :item_name, with: "Item B"
    click_button "Create Item"

    expect(current_path).to eq("/items")
    expect(page).to have_content(item_a.name)
    expect(page).to have_content("Item B")
  end
end
