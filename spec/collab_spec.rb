require('spec_helper')

describe(Collab) do

  describe('.clear_collabs') do
    it('deletes all entries in the collabs table that are associated with the specified table') do
      brand1 = Brand.create({:name => 'Nike', :price => 150.00})
      store1 = Store.create({:name => 'Foot locker'})
      store1.brands.push(brand1)
      Collab.clear_collabs(store1)
      expect(Collab.where("store_id = ?", store1.id())).to eq([])
    end
  end

  describe('.remove_collabs') do
    it('deletes all entries in the collabs table that are associated with the specified brands') do
      brand1 = Brand.create({:name => 'Nike', :price => 150.00})
      store1 = Store.create({:name => 'Foot locker'})
      store1.brands.push(brand1)
      Collab.remove_collabs([brand1])
      expect(Collab.where("brand_id = ?", brand1.id())).to eq([])
    end
  end

end
