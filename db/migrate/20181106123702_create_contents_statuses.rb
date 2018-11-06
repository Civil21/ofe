class CreateContentsStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :contents_statuses do |t|
      t.integer :content_id
      t.integer :status_id
    end
  end
end
