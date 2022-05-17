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
end
