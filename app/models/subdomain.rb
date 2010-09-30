class Subdomain < ActiveRecord::Base
  has_many :users
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  validates_uniqueness_of :name, :case_sensitive => false
  validates :name, :presence => true
end
