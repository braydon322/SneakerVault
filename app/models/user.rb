class User < ActiveRecord::Base
   has_secure_password
   has_many :shoes
@wishlist = []

def self.add_to_wishlist(shoe)
  @wishlist << shoe
end

  def self.wishlist
    @wishlist
  end

  def slug
  end

  def self.find_by_slug(slug)
  end
end
