class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :User_id, :integer
  end
end
