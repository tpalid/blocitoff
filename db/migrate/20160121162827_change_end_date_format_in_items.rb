class ChangeEndDateFormatInItems < ActiveRecord::Migration
  def change
    change_column :items, :end_date, :datetime
  end
end
