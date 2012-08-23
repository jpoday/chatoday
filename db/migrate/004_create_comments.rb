class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :content, :string
      t.column :room_id, :integer
      t.column :user_id, :integer
    end
    add_index :comments, :room_id
    add_index :comments, :user_id
  end
end
