class Collab < ActiveRecord::Base
  belongs_to :brand
  belongs_to :store

  def self.clear_collabs(table)
    table.collabs.each() do |collab|
      collab.destroy()
    end
  end

  def self.remove_collabs(brands_array)
    brands_array.each() do |brand|
      collabs_to_remove = Collab.where("brand_id = ?", brand.id())
      collabs_to_remove.each() do |collab|
        collab.destroy()
      end
    end
  end

end
