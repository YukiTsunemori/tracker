class CreateWorkspaces < ActiveRecord::Migration[8.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.boolean :role, default: true

      t.timestamps
    end
  end
end
