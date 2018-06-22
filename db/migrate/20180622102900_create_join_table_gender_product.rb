class CreateJoinTableGenderProduct < ActiveRecord::Migration[5.2]
  def change
    create_join_table :genders, :products do |t|
      t.index [:gender_id, :product_id]
      # t.index [:product_id, :gender_id]
    end
  end
end
