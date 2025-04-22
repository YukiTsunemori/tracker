class AddResolveToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :resolve, :boolean, default: false
  end
end
