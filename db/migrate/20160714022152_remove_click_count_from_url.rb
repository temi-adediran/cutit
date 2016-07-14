class RemoveClickCountFromUrl < ActiveRecord::Migration
  def change
    remove_column :urls, :click_count, :Integer
  end
end
