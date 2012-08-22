class CreateRoomUsers < ActiveRecord::Migration
  def change
    create_table :room_users do |t|
      t.column :room_id, :integer
      t.column :user_id, :integer
    end
    add_index :room_users, :room_id
    add_index :room_users, :user_id
  end
end
