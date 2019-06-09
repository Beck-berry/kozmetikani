class CreateIdoponts < ActiveRecord::Migration[5.0]
  def change
    create_table :idoponts do |t|
      t.text :todo
      t.datetime :fromTime
      t.datetime :toTime
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
