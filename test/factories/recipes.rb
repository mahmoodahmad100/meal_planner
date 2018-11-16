FactoryBot.define do
  factory :recipe do
    name "test meal"
    description "best egyptian meal 😂😂😂"
    association(:user)    
  end
end
