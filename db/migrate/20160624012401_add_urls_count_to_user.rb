class AddUrlsCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :urls_count, :integer, default: 0
  end
end
