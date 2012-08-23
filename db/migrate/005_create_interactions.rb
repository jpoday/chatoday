class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.column :room_id, :integer
      t.column :verb, :string, :default => "high-fives"
      t.column :subject_id, :integer
      t.column :receiver_id, :integer
    end
    add_index :interactions, :room_id
    add_index :interactions, :subject_id
    add_index :interactions, :receiver_id
  end
end
