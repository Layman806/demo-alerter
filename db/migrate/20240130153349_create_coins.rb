class CreateCoins < ActiveRecord::Migration[7.1]
  def change
    create_table :coins do |t|
      t.string :sym
      t.decimal :price

      t.timestamps
    end
  end
end
