class CreateSizeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :size_details do |t|
      t.belongs_to :size, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.timestamps
    end
  end
end
