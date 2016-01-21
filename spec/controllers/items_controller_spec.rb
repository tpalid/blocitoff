require 'rails_helper'

describe ItemsController do
    describe "item policies" do
        
        context "user with item" do
            before { @user = create!(:user_with_item) }
                
            it "creates a user with an item" do
                expect(@user.item).to_not be_nil
            end
        end
       
    end
end
            
            
          
        # permissions :new?, :create? do
        #   context "visitor" do
        #       let(:user) { nil }
               
        #       it { should 
        
    
    
