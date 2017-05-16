class Store < ActiveRecord::Base
  has_many :collabs
  has_many :brands, through: :collabs

  validates :name, length: { maximum: 100}
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  before_save(:capitalize_name)

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

private

  def capitalize_name
    self.name = self.name().capitalize()
  end

end
