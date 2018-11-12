class CreateNeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :needs do |t|
      t.integer :object_id
      t.string :object_type
      t.integer :subject_id
      t.string :subject_type

      t.timestamps
    end
  end
end
