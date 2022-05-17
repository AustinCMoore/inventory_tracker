class Item < ApplicationRecord
  #I originally considered including an attribute for category as an enum or string
  #to help users track the type of item in their inventory. Ultimately I decided
  #that this would not be part of the MVP defined by the prompt, and that if it
  #became a necessary feature, it would be a simple migration to add it.

  validates_presence_of :name
end
