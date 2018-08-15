class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :inout
      t.string :category
      t.string :title
      t.int :cost
      t.text :memo
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
