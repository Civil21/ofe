class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :name
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
