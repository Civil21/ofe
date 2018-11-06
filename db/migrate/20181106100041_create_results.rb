class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
