class User < ActiveRecord::Base
  belongs_to :subdomain, :primary_key => "name", :foreign_key => "subdomain_name"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :subdomain_name
  validates_uniqueness_of  :email, :case_sensitive => false
  attr_accessible :name, :subdomain_name, :email, :password, :password_confirmation, :remember_me
  #has_friendly_id :subdomain_name, :use_slug => true, :strip_non_ascii => true
  after_create :create_subdomain
  
  private
  
  def create_subdomain
    subdomain = Subdomain.find_by_name(self.subdomain_name)
    if !subdomain
       Subdomain.create! :name => self.subdomain_name, :user_id => self.id
    end
  end
end
