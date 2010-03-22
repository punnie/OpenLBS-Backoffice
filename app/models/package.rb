class Package < ActiveRecord::Base
  has_many :locations

  validates_presence_of :name

  def lbs_identifier
    return 'lbs://' + name.downcase + '/'
  end
end
