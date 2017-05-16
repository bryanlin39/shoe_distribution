require('spec_helper')

describe(Store) do

  describe('.all') do
    it('returns all stores in the database') do
      store1 = Store.create({:name => 'Foot locker'})
      expect(Store.all()).to eq([store1])
    end
  end

  describe('.create') do
    it('adds and saves a new store object into the database') do
      store1 = Store.create({:name => 'Foot locker'})
      expect(Store.all()).to eq([store1])
    end
  end

  describe('.update') do
    it('updates the store name in the database') do
      store1 = Store.create({:name => 'Foot locker'})
      store1.update({:name => 'Finish Line'})
      expect(store1.name()).to eq('Finish line')
    end
  end

  describe('.destroy') do
    it('deletes a store from the database') do
      store1 = Store.create({:name => 'Foot locker'})
      store1.destroy()
      expect(Store.all()).to eq([])
    end
  end

  describe('#name') do
    it('returns the name of the store') do
      store1 = Store.create({:name => 'Foot locker'})
      expect(store1.name()).to eq('Foot locker')
    end
  end

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
