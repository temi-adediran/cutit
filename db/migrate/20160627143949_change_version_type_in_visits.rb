class ChangeVersionTypeInVisits < ActiveRecord::Migration
  def change
    change_column(:visits, :version, :string)
  end
end
