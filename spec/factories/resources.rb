FactoryBot.define do
  factory :resource do
    published_date { Date.current }
    rubygem { Faker::App.name }
    title { Faker::Lorem.sentence }
    cve { rand(1..10000) }
  end
end
