Paperclip::Attachment.interpolations[:item_location_name] = proc do |attachment, style|
  attachment.instance.location.name
end

Paperclip::Attachment.interpolations[:item_package_name] = proc do |attachment, style|
  attachment.instance.location.package.name
end
