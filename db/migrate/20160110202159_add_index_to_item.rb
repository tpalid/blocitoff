class AddIndexToItem < ActiveRecord::Migration
  def change
    add_index :items, :user_id
  end
end
