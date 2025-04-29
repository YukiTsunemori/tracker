class CreateReplyMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :reply_messages do |t|
      t.text :reply_content
      t.references :post, null: false: { on_delete: :cascade }
      t.references :user, null: false: { on_delete: :cascade }

      t.timestamps
    end
  end
end
