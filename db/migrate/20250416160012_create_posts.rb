class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title_name
      t.text :parent_content
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :workspace, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
