class Location < ActiveRecord::Base
  belongs_to :package

  after_save :update_version

  validates_presence_of :name

  def lbs_identifier
    return 'lbs://' + package.name.downcase + '/' + name.downcase + '/'
  end

  def update_version
    package.version = package.version + 1
    package.save
  end

end