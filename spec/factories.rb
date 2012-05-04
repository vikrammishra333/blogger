require 'factory_girl'

#Factory.define :user do |u|
#  u.name 'Test User'
#  u.email 'user@test.com'
#  u.password 'please'
#end
#
#Factory.define :post do |p|
#  p.title 'Test Post'
#  p.description 'Full description for the title'
#  p.user_id 1
#end
FactoryGirl.define do
  factory :user, :aliases => [:author, :commenter] do
    name "Test User"
    email "user@test.com"
    password "please"
  end
end

FactoryGirl.define do
  factory :post do
    title "Test Post"
    description "Full description of the title"
    user_id 1
  end
end

Factory.define :question do |q|
  q.title 'question'
  q.description 'question summary'
end

