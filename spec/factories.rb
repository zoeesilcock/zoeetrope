FactoryGirl.define do
  factory :admin do
    email 'zoee@somedomain.com'
    password 'passwd'
  end

  factory :project do
    title 'zoeetrope'
    intro 'my homepage'
  end

  factory :screenshot do
    caption 'Sweet screenshot'
    image ''
    sort_order 0
  end

  factory :technology do
    title 'ruby'
  end
end
