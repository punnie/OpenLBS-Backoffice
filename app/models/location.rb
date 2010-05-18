class Location < ActiveRecord::Base
  belongs_to :package
  has_many :contents

  validates_presence_of :name
  validates_format_of :name, :with => /^[A-Za-z\d_]+$/, :message => "can only be alphanumeric with no spaces"

  before_create :set_editable_fields
  before_destroy :delete_contents

  named_scope :current, lambda { |version| { :conditions => ['locations.added <= ?', version] }}
  named_scope :future, lambda { |version| { :conditions => ['locations.added > ?', version] }}
  named_scope :to_be_deleted, lambda { |version| { :conditions => ['locations.deleted > ?', version] }}

  def lbs_identifier
    return 'lbs://' + package.name + '/' + name + '/'
  end

  def package_version
    self.package.version
  end

  def modified?
    return (self.contents.future(package_version).size > 0 || self.contents.to_be_deleted(package_version).size > 0)
  end

  def set_editable_fields
    self.added = self.package_version.next
    self.deleted = 0
  end

  def toggle_deleted
    if(self.package.locations.future(self.package_version).include?(self))
      return self.destroy
    end

    if self.deleted == 0
      self.deleted = self.package.version.next
    else
      self.deleted = 0
    end

    return save
  end

  def delete_contents
    self.contents.each { |c| c.destroy }
  end
  
end
