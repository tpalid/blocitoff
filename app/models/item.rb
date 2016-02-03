class Item < ActiveRecord::Base
  
    belongs_to :user
    require 'date'
    
    default_scope { order('end_date ASC') }
    
    validates :body, length: { minimum: 4 }, presence: true
    validates :user, presence: true
    # validates :lifespan, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
    

    def created_at
      created_at ||= Time.zone.now 
    end
    
    
    def lifespan=(days)
        self.end_date = self.created_at + days.to_i.days
    end
    
    def lifespan
      if self.end_date.present?
        (self.end_date - self.created_at)/1.day
      end
    end
    
    def days_left
      (self.end_date.to_date - Date.today).round(0)
    end
    
end
