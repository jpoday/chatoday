class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :string, :null => false
    end
  end
end
