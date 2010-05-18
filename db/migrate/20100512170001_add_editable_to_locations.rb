class AddEditableToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |l|
      l.integer :added
      l.integer :deleted
    end
  end

  def self.down
    change_table :locations do |l|
      l.remove :added
      l.remove :deleted
    end
  end
end
