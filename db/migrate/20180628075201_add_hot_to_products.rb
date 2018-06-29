class AddHotToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :hot, :boolean
  end
end
