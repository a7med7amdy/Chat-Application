class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :message_no
      t.string :body
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
