class CreateManners < ActiveRecord::Migration[5.0]
  def change
    create_table :manners do |t|

      t.timestamps
    end
  end
end
