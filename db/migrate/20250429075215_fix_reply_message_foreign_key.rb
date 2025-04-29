class FixReplyMessageForeignKey < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :reply_messages, :posts
    add_foreign_key :reply_messages, :posts, on_delete: :cascade
  end
end
