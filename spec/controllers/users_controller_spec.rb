require 'rails_helper'


describe UsersController do
    
    include Devise::TestHelpers
    
    before do
        @user = create(:user)
        @user2 = create(:user_with_items)
    end
    
      describe 'GET show' do
          
        context 'as a logged in user' do
            before { sign_in(@user2) }
           
            context 'viewing their own profile' do
            before { get :show, { id: @user2.id} }
            
                it 'returns success' do
                    expect(response).to be_success
                end
            
                it "assigns all the user's items to @items" do
                    expect(assigns(:items)).to eq(@user2.items)
                end
                
                it "renders the show view" do
                    expect(response).to render_template(:show)
                end
            end
            
            context "viewing somebody else's profile" do
                before{ sign_in(@user) }
                before{ get :show, { id: @user2.id} }
                
                it 'returns success' do
                    expect(response).to be_success
                end
                
                it "assigns only the user's public items to @items" do
                    expect(assigns(:items)).to include(@user2.items.where(public: true))
                    expect(assigns(:items)).to_not inlclude(@user2.items.were(public: false))
                end
                
                it "render the index view" do
                    expect(response).to render_template(:index)
                end
            end
        end
    end
end
            