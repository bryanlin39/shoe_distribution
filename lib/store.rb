class Store < ActiveRecord::Base
  has_many :collabs
  has_many :brands, through: :collabs

end
