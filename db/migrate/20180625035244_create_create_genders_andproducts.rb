class CreateCreateGendersAndproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :genders_products do |t|
      t.belongs_to :gender, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.timestamps
    end
  end
end
