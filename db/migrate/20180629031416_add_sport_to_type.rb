class AddSportToType < ActiveRecord::Migration[5.2]
  def change
    add_column :types, :sport, :boolean
  end
end
