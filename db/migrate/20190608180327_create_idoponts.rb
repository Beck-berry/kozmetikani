class CreateIdoponts < ActiveRecord::Migration[5.0]
  def change
    create_table :idoponts do |t|

      t.timestamps
    end
  end
end
