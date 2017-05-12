class Brand < ActiveRecord::Base
  has_many :collabs
  has_many :stores, through: :collabs

  # validates :name, length: { maximum: 100}
  # validates :name, presence: true
  before_save(:capitalize_name)
  # before_create(:format_price)

  def self.ids_to_brands(id_array)
    brands_array = []
    id_array.each() do |brand_id|
      brand = Brand.find(brand_id.to_i())
      brands_array.push(brand)
    end
    brands_array
  end

private

  def capitalize_name
    self.name = self.name().capitalize()
  end

  # def format_price
  #   self.price = self.price().round(2)
  # end

end
