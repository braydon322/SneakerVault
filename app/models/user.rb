class User < ActiveRecord::Base
   has_secure_password
   has_many :shoes

  def slug
  end

  def self.find_by_slug(slug)
  end
end
