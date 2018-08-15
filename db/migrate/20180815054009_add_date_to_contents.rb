class AddDateToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :date, :string
  end
end
