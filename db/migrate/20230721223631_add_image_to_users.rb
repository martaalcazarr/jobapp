class AddImageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :image, null: false, foreign_key: true
  end
end
