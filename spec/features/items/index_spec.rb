require 'rails_helper'

RSpec.describe 'items index page' do
  it "lists all existing items" do
    item_a = Item.create!(name: 'Item A')
    item_b = Item.create!(name: 'Item B')
    item_c = Item.create!(name: 'Item C')

    visit "/items"
    expect(current_path).to eq("/items")

    expect(page).to have_content(item_a.name)
    expect(page).to have_content(item_b.name)
    expect(page).to have_content(item_c.name)
  end

  it "has a button that links to a new item page" do
    visit "/items"
    click_button "Add Item"
    expect(current_path).to eq("/item/new")
  end

  it "has a button that links to an item's edit page" do
    item_a = Item.create!(name: 'Item A')
    visit "/items"
    click_button "Edit Item A"
    expect(current_path).to eq("/item/#{item_a.id}/edit")
  end

  it "has a button that deletes an item" do
    item_a = Item.create!(name: 'Item A')
    item_b = Item.create!(name: 'Item B')

    visit "/items"

    expect(page).to have_content(item_a.name)
    expect(page).to have_content(item_b.name)

    click_button "Delete Item A"

    expect(current_path).to eq("/items")

    expect(page).to_not have_content(item_a.name)
    expect(page).to have_content(item_b.name)
  end
end
