class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :chat_no
      t.integer :messages_count
      t.references :app, null: false, foreign_key: true

      t.timestamps
    end
  end
end
