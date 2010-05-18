class AddOrderAndEditablesToContent < ActiveRecord::Migration
  def self.up
    change_table :contents do |c|
      c.integer :added
      c.integer :deleted
      c.integer :order
    end
  end

  def self.down
    change_table :contents do |c|
      c.remove :added
      c.remove :deleted
      c.remove :order
    end
  end
end
