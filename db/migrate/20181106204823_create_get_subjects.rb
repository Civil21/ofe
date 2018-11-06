class CreateGetSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :get_subjects do |t|
      t.integer :subject_id
      t.string :get_subject_type
      t.integer :get_subject_id

      t.timestamps
    end
  end
end
