class AddPackageToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.belongs_to :package
    end
  end

  def self.down
        remove_column locations, :package_id
  end
end
