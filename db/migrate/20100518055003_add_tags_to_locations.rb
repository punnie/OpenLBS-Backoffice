class AddTagsToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |l|
      l.string :tags
    end
  end

  def self.down
    change_table :locations do |l|
      l.remove :tags
    end
  end
end
