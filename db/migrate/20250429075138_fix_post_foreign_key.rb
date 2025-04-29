class FixPostForeignKey < ActiveRecord::Migration[8.0]
  def change
    # 既存の外部キー制約を削除
    remove_foreign_key :posts, :workspaces

    # カスケード付きで再追加
    add_foreign_key :posts, :workspaces, on_delete: :cascade
  
  end
end
