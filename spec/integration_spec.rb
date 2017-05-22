require('spec_helper')

describe('CRUD functionality for Brand objects', {:type => :feature}) do
  it('allows a user to add a new brand and update its name and price') do
    visit('/brands')
    fill_in('brand_name', :with => 'Nike')
    fill_in('brand_price', :with => '150')
    click_button('Add to Catalog')
    expect(page).to have_content('Nike: $150.0')
    click_link('Nike')
    fill_in('update_brand_name', :with => 'Adidas')
    click_button('Update')
    expect(page).to have_content('Adidas')
    expect(page).to have_no_content('Nike')
    fill_in('update_brand_price', :with => '120')
    click_button('Update')
    expect(page).to have_content('$120.0')
  end

  it('allows a user to delete an existing brand') do
    visit('/brands')
    fill_in('brand_name', :with => 'Nike')
    fill_in('brand_price', :with => '150')
    click_button('Add to Catalog')
    click_link('Nike')
    click_button('Delete')
    expect(page).to have_no_content('Nike')
  end
end

describe('CRUD functionality for Store objects', {:type => :feature}) do
  it('allows a user to add and update a new store') do
    visit('/stores')
    fill_in('store_name', :with => 'Foot locker')
    click_button('Add to Distribution List')
    expect(page).to have_content('Foot locker')
    click_link('Foot locker')
    fill_in('update_store_name', :with => 'Finish line')
    click_button('Update')
    expect(page).to have_content('Finish line')
  end

  it('allows a user to delete a store') do
    visit('/stores')
    fill_in('store_name', :with => 'Foot locker')
    click_button('Add to Distribution List')
    click_link('Foot locker')
    click_button('Delete')
    expect(page).to have_no_content('Foot locker')
  end
end

describe('assign brands to stores', {:type => :feature}) do
  it('allows a user to add a brand to a store') do
    brand = Brand.create({:name => 'Nike', :price => 150})
    store = Store.create({:name => 'Foot locker'})
    visit('/stores')
    click_link('Foot locker')
    page.check(brand.name())
    click_button('Update')
    expect(page).to have_content('Nike')
  end
end
