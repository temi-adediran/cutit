class AddUserToUrls < ActiveRecord::Migration
  def change
    add_reference :urls, :user, index: true, foreign_key: true
  end
end
