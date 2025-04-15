class AddDefaultToParticipants < ActiveRecord::Migration[8.0]
  def change
    change_column_default :participants, :role, false
  end
end
