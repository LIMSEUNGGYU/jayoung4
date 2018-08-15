class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone
      t.string :relation
      t.integer :sum

      t.timestamps
    end
  end
end
