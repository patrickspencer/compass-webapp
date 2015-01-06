FactoryGirl.define do
  factory :user do
    sequence(:id_string) { |n| "user#{n}"  }
    sequence(:first_name) { |n| "John#{n}"  }
    sequence(:last_name) { |n| "Doe#{n}"  }
    sequence(:email) { |n| "student#{n}@example.com"  }
    password "password"
  end
end
