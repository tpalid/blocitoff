class Item < ActiveRecord::Base
    belongs_to :user
    
    # default_scope { order('DESC') }
    
    scope :visible_to, -> (user) { user ? all : where(public: true) }
    
    # def visible_to(user)
    #   if self.user_id == user.id || user.admin.true?
    #     all
    #   else
    #     where(public: true)
    #   end
    # end
        
  
    def days_left
      lifespan.to_i - (DateTime.now.to_date - created_at.to_date).to_i
    end
end
