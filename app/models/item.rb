class Item < ActiveRecord::Base
  
    belongs_to :user
    require 'date'
    
    default_scope { order('end_date ASC') }
    
    validates :body, length: { minimum: 5 }, presence: true
    validates :user, presence: true
    

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
      (self.end_date.to_date - Date.today).to_i
    end
    
end
