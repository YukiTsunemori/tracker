class CreateReplyMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :reply_messages do |t|
      t.text :reply_content
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
