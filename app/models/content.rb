class Content < ActiveRecord::Base
  belongs_to :location

  has_attached_file :item, 
                    :path => ":rails_root/data/:item_package_name/:item_location_name/:basename.:extension",
                    :url => "/contents/:item_content_id"

  validates_attachment_presence :item
  validates_uniqueness_of :item_file_name

  before_create :set_editable_fields

  named_scope :current, lambda { |version| { :conditions => ['contents.added <= ?', version] }}
  named_scope :future, lambda { |version| { :conditions => ['contents.added > ?', version] }}
  named_scope :to_be_deleted, lambda { |version| { :include => :location, :conditions => ['contents.deleted > ? OR locations.deleted > ?', version, version] }}

  def toggle_deleted
    if(self.location.contents.future(self.location.package_version).include?(self))
      return self.destroy
    end

    if self.deleted == 0
      self.deleted = self.location.package.version.next
    else
      self.deleted = 0
    end

    return save
  end

  def deleted?
    return self.deleted > self.location.package.version
  end

  def set_editable_fields
    self.added = self.location.package.version.next
    self.deleted = 0
  end

end
