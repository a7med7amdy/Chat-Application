class CreateApps < ActiveRecord::Migration[7.0]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :access_token
      t.integer :chats_count

      t.timestamps
    end
    add_index :apps, :access_token, unique: true
  end
end
