class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.column :name, :string, :null => false
    end
  end
end
