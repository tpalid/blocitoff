class Item < ActiveRecord::Base
    # body
    # created_at
    # end_date
    
    def lifespan
        (self.end_date - self.created_at).to_days # experiment on how to actually do
    end
    
    def lifespan=(days)
        self.end_date = self.created_at + days.days
    end
end





params = {item: {body: 'asdf', lifespan: '7'}}
item_params = params.require(:item).permit(:body, :lifespan)
def create
    @item = Item.new("body"=>"asdf")
    @item.end_date = @item.create_at + params[:lifespan].days
    # ..
end

class Item
    def self.new(hash)
        item = super
        hash.each do |k,v|
            item.send("#{k}=", v)
        end
    end
end