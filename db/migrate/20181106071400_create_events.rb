class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :desc
      t.integer :project_id

      t.timestamps
    end
  end
end
