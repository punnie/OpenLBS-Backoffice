require 'zip/zip'
require 'zip/zipfilesystem'

class Package < ActiveRecord::Base
  has_many :locations
  has_many :contents, :through => :locations

  validates_presence_of :name
  validates_format_of :name, :with => /^[A-Za-z\d_]+$/, :message => "can only be alphanumeric with no spaces"

  def lbs_identifier
    return 'lbs://' + name + '/'
  end

  def update_version
    self.locations.to_be_deleted(version).each { |l| l.destroy }
    self.contents.to_be_deleted(version).each { |c| c.destroy }

    self.version = self.version.next

    # zip the crap out of the contents
    self.create_zip
    
    return self.save
  end

  def needs_update?
    update_needed = false

    self.locations.each do |l|
      if l.modified? || l.added > version || l.deleted > version
        update_needed = true
        break
      end
    end
    
    return update_needed
  end

  def current_size
    self.contents.current(version).sum('item_file_size').bytes
  end

  def future_size
    self.current_size + self.contents.future(version).sum('item_file_size').bytes - self.contents.to_be_deleted(version).sum('item_file_size').bytes
  end

  def create_zip

    prev_zip_filename = "#{RAILS_ROOT}/public/packages/#{name}-#{version-1}.zip"

    # delete the previous version file.
    File.delete(prev_zip_filename) if File.file?(prev_zip_filename)

    return if self.contents.empty?

    # check to see if the file exists already, and if it does, delete it.
    File.delete(zip_file_name) if File.file?(zip_file_name)

    # open or create the zip file
    Zip::ZipFile.open(zip_file_name, Zip::ZipFile::CREATE) do |zipfile|

      self.locations.current(version).each do |l|
        next if l.contents.current(version).empty?

        l.contents.current(version).each do |c|
          zipfile.add("#{name}/#{l.name}/#{c.item_file_name}", "#{RAILS_ROOT}/data/#{name}/#{l.name}/#{c.item_file_name}")
        end
      end
      
    end

    # set read permissions on the file
    File.chmod(0644, zip_file_name)
  end

  def zip_file_name
    return "#{RAILS_ROOT}/public/packages/#{name}-#{version}.zip"
  end

  def content_file_name
    return "#{name}-#{version}.zip"
  end

  def content_file_size
    return (File.file?(zip_file_name)) ? File.size(zip_file_name) : -1
  end

end
