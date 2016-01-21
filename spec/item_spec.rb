require 'rails_helper'

describe ItemPolicy do
    describe "item policies" do
        
        before do
            @user = create!(:user)
          
        permissions :new?, :create? do
           context "visitor" do
               let(:user) { nil }
               
               it { should 
        
    
    
    
end

