class ChangeImageIdInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :image_id, :bigint, null: true
  end
end