class AddLifespanToItem < ActiveRecord::Migration
  def change
    add_column :items, :lifespan, :integer
  end
end
