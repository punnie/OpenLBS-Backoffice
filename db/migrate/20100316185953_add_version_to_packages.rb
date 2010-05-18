class AddVersionToPackage < ActiveRecord::Migration
  def self.up
    change_table :packages do |t|
      t.integer :version, :default => 0
    end
  end

  def self.down
    remove_column :packages, :version
  end
end
