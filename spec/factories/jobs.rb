FactoryBot.define do
  factory :job do
    title { 'title' }
    job_type { "Full-time" }
    location { "location" }
    description { "MyString" }
    company_name { "MyString" }
    website { '' }
    association :user
     end

     end
