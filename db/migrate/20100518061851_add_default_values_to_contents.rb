class AddDefaultValuesToContents < ActiveRecord::Migration
  def self.up
    change_column(:contents, :tags, :string, :default => "")
    change_column(:contents, :name, :string, :default => "")
    change_column(:contents, :added, :integer, :default => 0)
    change_column(:contents, :deleted, :integer, :default => 0)
    change_column(:contents, :order, :integer, :default => 0)
  end

  def self.down
    change_column(:contents, :tags, :string)
    change_column(:contents, :name, :string)
    change_column(:contents, :added, :integer)
    change_column(:contents, :deleted, :integer)
    change_column(:contents, :order, :integer)
  end
end
