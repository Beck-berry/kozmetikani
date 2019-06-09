class CreateKezeles < ActiveRecord::Migration[5.0]
  def change
    create_table :kezeles do |t|
      t.integer :minutes
      t.string :name
      t.text :desc
      t.integer :price
      t.timestamps
    end
  end
end
