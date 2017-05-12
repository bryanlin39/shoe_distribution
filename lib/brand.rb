class Brand < ActiveRecord::Base
  has_many :collabs
  has_many :stores, through: :collabs

  def self.ids_to_brands(id_array)
    brands_array = []
    id_array.each() do |brand_id|
      brand = Brand.find(brand_id.to_i())
      brands_array.push(brand)
    end
    brands_array
  end

end
