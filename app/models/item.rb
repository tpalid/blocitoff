class Item < ActiveRecord::Base
  
    belongs_to :user
    require 'date'
    
    # attr_writer :lifespan
    # after_save :set_end_date
    
    # def set_end_date
    #   if @lifespan
    #     end_date = self.created_at + lifespan.days
    #     self.update(end_date: end_date) unless self.end_date == end_date
    #   end
    # end
    
    # default_scope { order('end_date DESC' :end_date) }
    
    def created_at
      created_at ||= Time.zone.now 
    end
    
    # def end_date
    #   end_date ||= Time.zone.now + 1.day
    # end
    
    def lifespan=(days)
        # self.end_date = self.created_at + days.days
        self.end_date = self.created_at + days.to_i.days
    end
    
    def lifespan
      (self.end_date - self.created_at)/86400
    end
    
   
    def days_left
      (self.end_date.to_date - Date.today).to_i
    end
    
end
