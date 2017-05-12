require('spec_helper')

describe(Store) do
  describe('.all') do
    it('returns all stores in the database') do
      store1 = Store.create({:name => 'Foot Locker'})
      expect(Store.all()).to eq([store1])
    end
  end

  describe('.create') do
    it('adds and saves a new store object into the database') do
      store1 = Store.create({:name => 'Foot Locker'})
      expect(Store.all()).to eq([store1])
    end
  end

  describe('.update') do
    it('updates the store name in the database') do
      store1 = Store.create({:name => 'Foot Locker'})
      store1.update({:name => 'Finish Line'})
      expect(store1.name()).to eq('Finish Line')
    end
  end

  describe('.destroy') do
    it('deletes a store from the database') do
      store1 = Store.create({:name => 'Foot Locker'})
      store1.destroy()
      expect(Store.all()).to eq([])
    end
  end

  describe('#name') do
    it('returns the name of the store') do
      store1 = Store.create({:name => 'Foot Locker'})
      expect(store1.name()).to eq('Foot Locker')
    end
  end

end
