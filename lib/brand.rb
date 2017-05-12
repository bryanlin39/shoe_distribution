class Brand < ActiveRecord::Base
  has_many :collabs
  has_many :stores, through: :collabs

end
