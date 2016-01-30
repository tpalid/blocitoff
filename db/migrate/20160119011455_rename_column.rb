class RenameColumn < ActiveRecord::Migration
  def change
    rename_column  :items, :lifespan, :end_date
  end
end
