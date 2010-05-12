class Content < ActiveRecord::Base
  belongs_to :location

  has_attached_file :item, 
                    :path => ":rails_root/public/data/:item_package_name/:item_location_name/:basename.:extension",
                    :url => "/data/:item_package_name/:item_location_name/:basename.:extension"

  validates_attachment_presence :item
end
