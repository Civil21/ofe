class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :type
      t.string :desc

      t.timestamps
    end
  end
end
