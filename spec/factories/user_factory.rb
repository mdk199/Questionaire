FactoryGirl.define do
  factory :user do
    sequence(:username)  {|n| "user_#{n}" }
    password              'password'
    password_confirmation 'password'
    sequence(:email)      {|n| "email_#{n}@playstation.sony.com" }
    role                  'User'
  end

  factory :admin_user, :parent => :user do
    after(:create) {|user| user.update_attribute :role, "Admin" }
  end
end