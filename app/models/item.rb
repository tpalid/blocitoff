class Item < ActiveRecord::Base
    belongs_to :user
    
     def days_left
      lifespan.to_i - (DateTime.now.to_date - created_at.to_date).to_i
    end
end
