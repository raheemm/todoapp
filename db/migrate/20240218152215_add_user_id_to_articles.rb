class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :user_id, :int
  end
end
