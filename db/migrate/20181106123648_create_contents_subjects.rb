class CreateContentsSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :contents_subjects do |t|
      t.integer :content_id
      t.integer :subject_id
    end
  end
end
