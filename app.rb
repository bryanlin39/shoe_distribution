require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

# all stores
get('/stores') do
  @stores = Store.all()
  erb(:all_stores)
end

post('/stores/new') do
  store_name = params[:store_name]
  Store.create({:name => store_name})
  @stores = Store.all()
  erb(:all_stores)
end

# individual store
get('/stores/:id') do
  @store = Store.find(params[:id].to_i())
  @available_brands = @store.available_brands()
  erb(:individual_store)
end

patch('/stores/:id/edit') do
  @store = Store.find(params[:id].to_i())
  if params[:update_store_name] == ""
    name = @store.name()
  else
    name = params[:update_store_name]
  end
  @store.update({:name => name})

  add_brands_array = Brand.ids_to_brands(params.fetch(:add_brands, []))
  @store.add_brands(add_brands_array)

  remove_brands_array = Brand.ids_to_brands(params.fetch(:remove_brands, []))
  Collab.remove_collabs(remove_brands_array)

  @available_brands = @store.available_brands()
  erb(:individual_store)
end

delete('/stores/:id/delete') do
  store = Store.find(params[:id].to_i())
  Collab.clear_collabs(store)
  store.destroy()
  @stores = Store.all()
  erb(:all_stores)
end

# all brands
get('/brands') do
  @brands = Brand.all()
  erb(:all_brands)
end

post('/brands/new') do
  brand_name = params[:brand_name]
  brand_price = params[:brand_price].to_i()
  Brand.create({:name => brand_name, :price => brand_price})
  @brands = Brand.all()
  erb(:all_brands)
end

# individual brand
get('/brands/:id') do
  @brand = Brand.find(params[:id].to_i())
  erb(:individual_brand)
end

patch('/brands/:id/edit') do
  @brand = Brand.find(params[:id].to_i())
  if params.fetch(:update_brand_name) == ""
    name = @brand.name()
  else
    name = params.fetch(:update_brand_name)
  end

  if params.fetch(:update_brand_price) == ""
    price = @brand.price()
  else
    price = params.fetch(:update_brand_price).to_i()
  end

  @brand.update({:name => name, :price => price})
  erb(:individual_brand)
end

delete('/brands/:id/delete') do
  brand = Brand.find(params[:id].to_i())
  Collab.clear_collabs(brand)
  brand.destroy()
  @brands = Brand.all()
  erb(:all_brands)
end
