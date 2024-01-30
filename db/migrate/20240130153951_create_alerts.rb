class CreateAlerts < ActiveRecord::Migration[7.1]
  def change
    create_table :alerts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coin, null: false, foreign_key: true
      t.string :status
      t.decimal :price

      t.timestamps
    end
  end
end
