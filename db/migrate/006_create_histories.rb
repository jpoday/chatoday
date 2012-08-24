class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.column :room_id, :integer
      t.references :event, :polymorphic => true
      t.timestamps
    end
  end
end
