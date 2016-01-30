FactoryGirl.define do
    factory :user do
        name "Natalie Smith"
        sequence(:email, 100) { |n| "person#{n}@example.com" }
        password "helloworld"
        password_confirmation "helloworld"
        confirmed_at Time.now
        
        factory :user_with_items do
            after(:create) do |user|
                create(:item, user: user)
                create(:private_item, user: user, public: false)
            end
        end
        
        factory :admin do
            role "admin"
        end
    end
end
    
 