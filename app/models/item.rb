class Item < ActiveRecord::Base
    belongs_to :user
    
    # default_scope { order('DESC') }
    
    def lifespan=(days)
        self.end_date = self.created_at + days.days
    end
    
    def days_left
      lifespan.to_i - (DateTime.now.to_date - created_at.to_date).to_i
    end
    
    def lifespan
        self.end_date.to_days - self.created_at.to_days 
    end
    
end
