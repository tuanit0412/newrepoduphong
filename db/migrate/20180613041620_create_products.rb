class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price
      t.references :type, foreign_key: true
      t.references :gender, foreign_key: true
      t.timestamps
    end
  end
end
