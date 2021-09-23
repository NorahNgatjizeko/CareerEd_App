FactoryBot.define do
  factory :employment do

    job_id { 1 }
    association :user
  end
end
