class Store < ActiveRecord::Base
  has_many :collabs
  has_many :brands, through: :collabs

  def add_brands(brands_array)
    brands_array.each() do |brand|
      self.brands.push(brand)
    end
  end

  def available_brands
    available_brands = []
    Brand.all.each() do |brand|
      if self.brands.include?(brand) == false
        available_brands.push(brand)
      end
    end
    available_brands
  end

end
