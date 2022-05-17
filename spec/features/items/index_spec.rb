require 'rails_helper'

Rspec.describe 'items index page' do

  it "lists all existing items" do
    item_a = Item.create!(name: 'Item A')
    item_b = Item.create!(name: 'Item B')
    item_c = Item.create!(name: 'Item C')

    visit "/items"
    expect(current_path).to eq("/items")

    expect(page).to have_content(item_a)
    expect(page).to have_content(item_b)
    expect(page).to have_content(item_c)
  end
end
