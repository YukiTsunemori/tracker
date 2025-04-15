class CreateParticipants < ActiveRecord::Migration[8.0]
  def change
    create_table :participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workspace, null: false, foreign_key: true
      t.boolean :role

      t.timestamps
    end

    add_index :participants, [:user_id, :created_at]
  end
end
