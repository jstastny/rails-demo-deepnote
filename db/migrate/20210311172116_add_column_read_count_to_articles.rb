class AddColumnReadCountToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :read_count, :integer
  end
end
