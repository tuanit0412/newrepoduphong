class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.float :sizeus
      t.float :sizeuk
      t.float :sizevn

      t.timestamps
    end
  end
end
