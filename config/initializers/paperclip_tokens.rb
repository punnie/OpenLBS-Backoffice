Paperclip.interpolates :item_location_name do |attachment, style|
  attachment.instance.location.name
end

Paperclip.interpolates :item_package_name do |attachment, style|
  attachment.instance.location.package.name
end

Paperclip.interpolates :item_content_id do |attachment, style|
  attachment.instance.id
end