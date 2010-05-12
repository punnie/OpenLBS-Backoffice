class Location < ActiveRecord::Base
  belongs_to :package
  has_many :contents

  after_save :update_version

  validates_presence_of :name

  def lbs_identifier
    return 'lbs://' + package.name + '/' + name + '/'
  end

  def update_version
    package.version = package.version + 1
    package.save
  end

end
