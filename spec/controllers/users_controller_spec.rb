require 'rails_helper'


describe UsersController do
    include Devise::TestHelpers
    
    let(:non_admin_user) { create(:user) }
    let(:admin_user) { create(:admin) }
    let(:other_user) { create(:user) }
    let(:public_item) { create(:item, user: user, public: true) }
    let(:private_item) { create(:item, user: user, public: false) }
    
    describe 'GET show' do
        let(:request) { get :show, {id: user.id} }
        
        context 'while logged in' do
            before { @request.env["devise.mapping"] = Devise.mappings[:user] }
            before { sign_in(current_user) }
            before { request }
            
            context 'as a non-admin' do
                let(:current_user) { non_admin_user } 
            
                context 'viewing their own profile' do
                    let(:user) { current_user }
                    
                    it "assigns all the user's items to @items" do
                        expect(assigns(:items)).to include(public_item, private_item)
                    end
                end
                
                context "viewing somebody else's profile" do
                    let(:user) { other_user }
                    
                    it "assigns all the user's public items ot @item" do
                        expect(assigns(:items)).to include(public_item)
                    end
                    
                    it "doesn't assign any of the user's private items" do
                        expect(assigns(:items)).to_not include(private_item)
                    end
                end
            end
            
            context 'as an admin' do
                let(:current_user) { admin_user }
                
                context "viewing somebody else's profile" do
                    let(:user) { other_user }
                    
                    it "assigns all the user's items to @items" do
                        expect(assigns(:items)).to include(public_item, private_item)
                    end
                end
            end
        end
    end
end
    
#       describe 'GET show' do
          
#         context 'as a logged in user' do
            
#             context 'viewing their own profile' do
#             before { sign_in(@user2) }
#             before { get :show, { id: @user2.id} }
            
#                 it 'returns success' do
#                     expect(response).to be_success
#                 end
            
#                 it "assigns all the user's items to @items" do
#                     expect(assigns(:items)).to eq(@user2.items)
#                 end
                
#                 it "renders the show view" do
#                     expect(response).to render_template(:show)
#                 end
#             end
            
#             context "viewing somebody else's profile" do
#                 before{ sign_in(@user) }
#                 before{ get :show, { id: @user2.id} }
                
#                 it 'returns success' do
#                     expect(response).to be_success
#                 end
                
#                 it "assigns only the user's public items to @items" do
#                     expect(assigns(:items)).to include(@user2.items.where(public: true))
#                     expect(assigns(:items)).to_not include(@user2.items.were(public: false))
#                 end
                
#                 it "render the index view" do
#                     expect(response).to render_template(:show)
#                 end
#             end
            
#             context "admin viewing profile" do
#                 before{ sign_in(@admin) }
#                 before{ get :show, {id: @user2.id} }
                
#                 it 'returns success' do
#                     expect(response).to be_success
#                 end
                
#                 it "assigns all the user's items to @items" do
#                     expect(assigns(:items)).to eq(@user2.items)
#                 end
                
#                 it "render the index view" do
#                     expect(response).to render_template(:show)
#                 end
#             end
#         end
#     end
# end
            