class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :name
      t.references :location
      t.string :tags
      t.string :item_file_name
      t.string :item_content_type
      t.integer :item_file_size
      t.datetime :item_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
