class CreateContentsItems < ActiveRecord::Migration[5.1]
  def change
    create_table :contents_items do |t|
      t.integer :content_id
      t.integer :item_id
    end
  end
end
