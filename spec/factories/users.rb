# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "Jsmith#{n}" }
    name { 'John Smith' }
    url { 'http://example.com' }
    avatar_url { 'http://example.com/avatar' }
    provider { 'Github' }
  end
end
