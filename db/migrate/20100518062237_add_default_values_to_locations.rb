class AddDefaultValuesToLocations < ActiveRecord::Migration
  def self.up
    change_column(:locations, :added, :integer, :default => 0)
    change_column(:locations, :deleted, :integer, :default => 0)
    change_column(:locations, :tags, :string, :default => "")
  end

  def self.down
    change_column(:locations, :added, :integer)
    change_column(:locations, :deleted, :integer)
    change_column(:locations, :tags, :string)
  end
end
