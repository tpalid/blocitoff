FactoryGirl.define do
    factory :item do
        body "Item Body"
        created_at Time.now
        lifespan 10
    end
end
        
        