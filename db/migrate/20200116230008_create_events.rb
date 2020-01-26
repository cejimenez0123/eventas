class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :dis
      t.integer :created_by_id
    end
  end
end
