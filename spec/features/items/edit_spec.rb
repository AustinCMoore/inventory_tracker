require 'rails_helper'

RSpec.describe 'items edit page' do
  it "has a form to edit an item" do
    item_a = Item.create!(name: 'Item A')
    visit "/items/#{item_a.id}/edit"
    expect(current_path).to eq("/items/#{item_a.id}/edit")

    expect(page).to have_content(item_a.name)
    expect(page).to have_content("Edit name")
    expect(page).to have_button("Submit")
  end

  it "routes to the index page upon successful submission, where the item is now updated" do
    item = Item.create!(name: 'Item A')
    visit "/items"

    expect(page).to have_content("Item A")
    expect(page).to_not have_content("Item B")

    visit "/items/#{item.id}/edit"
    fill_in :item_name, with: "Item B"
    click_button "Submit"

    expect(current_path).to eq("/items")
    expect(page).to_not have_content("Item A")
    expect(page).to have_content("Item B")
  end

  it "routes back to the index page when name is not filled out" do
    item = Item.create!(name: 'Item A')
    visit "/items"

    expect(page).to have_content("Item A")
    expect(page).to_not have_content("Item B")

    visit "/items/#{item.id}/edit"
    click_button "Submit"

    expect(current_path).to eq("/items/#{item.id}/edit")
  end
end
