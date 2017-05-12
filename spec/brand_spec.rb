require('spec_helper')

describe(Brand) do

  describe('.all') do
    it('returns all brands in the database') do
      brand1 = Brand.create({:name => 'Nike'})
      expect(Brand.all()).to eq([brand1])
    end
  end

  describe('.create') do
    it('adds and saves a new brand object into the database') do
      brand1 = Brand.create({:name => 'Nike'})
      expect(Brand.all()).to eq([brand1])
    end
  end

  describe('.update') do
    it('updates the brand name in the database') do
      brand1 = Brand.create({:name => 'Nike'})
      brand1.update({:name => 'Adidas'})
      expect(brand1.name()).to eq('Adidas')
    end
  end

  describe('.destroy') do
    it('deletes a brand from the database') do
      brand1 = Brand.create({:name => 'Nike'})
      brand1.destroy()
      expect(Brand.all()).to eq([])
    end
  end

  describe('#name') do
    it('returns the name of the brand') do
      brand1 = Brand.create({:name => 'Nike'})
      expect(brand1.name()).to eq('Nike')
    end
  end

  describe('#price') do
    it('returns the price of the brand') do
      brand1 = Brand.create({:name => 'Nike', :price => 150.00})
      expect(brand1.price()).to eq(150.00)
    end
  end

end
