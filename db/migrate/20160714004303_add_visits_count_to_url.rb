class AddVisitsCountToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :visits_count, :Integer, :default => 0
  end
end
