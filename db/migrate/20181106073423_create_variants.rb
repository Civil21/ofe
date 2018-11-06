class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants do |t|
      t.string :name
      t.string :desc
      t.integer :event_id
      t.integer :variant_id

      t.timestamps
    end
  end
end
