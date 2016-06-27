class AddUrlRefToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :url, index: true, foreign_key: true
  end
end
