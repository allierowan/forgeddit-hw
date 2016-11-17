class CreateShares < ActiveRecord::Migration[5.0]
  def change
    create_table :shares do |t|
      t.text :title
      t.text :url
      t.integer :user_id

      t.timestamps
    end
  end
end
