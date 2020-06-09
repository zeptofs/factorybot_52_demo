# frozen_string_literal: true

FactoryBot.define do
  trait :with_ref do
    with_ref { true }
  end

  trait :generate_ref do
    transient do
      with_ref { nil }
    end

    after(:create) do |record, evaluator|
      if evaluator.with_ref == true # do not create a ref if it's nil
        Ref.transaction(requires_new: true) do
          Ref.create! name: rand(100), target_id: record.id, target_type: record.class.name
        end
      elsif evaluator.with_ref.present?
        record.create_ref(name: evaluator.with_ref)
      end
    end
  end

  factory :post, traits: [:generate_ref, :with_ref] do
    body { 'Post body' }

    trait :approved do
      body { 'New body' }

      before(:create) do |p|
        au = create :author, :with_ref
        p.author = au
      end
    end
  end

  factory :author, traits: [:generate_ref, :with_ref] do
    name { 'Swagamir' }
  end

  factory :ref do
  end
end
