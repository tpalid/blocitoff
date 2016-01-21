class Item < ActiveRecord::Base
    belongs_to :user
    
    default_scope { order('end_date DESC' :end_date) }
    
    def created_at
      self.attributes[:created_at] ||= Time.now
    end
    
     def lifespan
        (self.end_date - self.created_at)
    end
    
    def lifespan=(days)
        self.end_date = self.created_at + days.days
    end
    
    def days_left
      lifespan.to_i - (DateTime.now.to_date - created_at.to_date).to_i
    end
    
    def lifespan
        (self.end_date - self.created_at).to_f.to_days
    end
    
end
