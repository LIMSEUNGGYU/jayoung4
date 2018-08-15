class AddUserToContents < ActiveRecord::Migration[5.0]
  def change
    add_reference :contents, :user, foreign_key: true
  end
end
