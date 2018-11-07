class CreateGets < ActiveRecord::Migration[5.1]
  def change
    create_table :gets do |t|
      t.string :object_type
      t.integer :object_id
      t.string :subject_type
      t.integer :subject_id

      t.timestamps
    end
  end
end
