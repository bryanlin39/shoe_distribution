require('spec_helper')

describe(Store) do

  describe('#add_brands') do
    it('adds brands to the array of associated brands in the store object') do
      brand1 = Brand.create({:name => 'Nike', :price => 150.00})
      store1 = Store.create({:name => 'Foot locker'})
      store1.add_brands([brand1])
      expect(store1.brands()).to eq([brand1])
    end
  end

  describe('#available_brands') do
    it('returns the brands that are not associated with any stores') do
      brand1 = Brand.create({:name => 'Nike', :price => 150.00})
      brand2 = Brand.create({:name => 'Adidas', :price => 120.00})
      store1 = Store.create({:name => 'Foot locker'})
      store1.brands.push(brand1)
      expect(store1.available_brands()).to eq([brand2])
    end
  end

  describe('#capitalize_name') do
    it('capitalizes the first letter of the first word of an inputted name') do
      brand1 = Brand.create({:name => 'nike', :price => 150.00})
      expect(brand1.name()).to eq('Nike')
    end
  end

end
