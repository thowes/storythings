FactoryGirl.define do
	factory :user do
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}
		password "foobar"
		password_confirmation "foobar"
		privacy 10 

		factory :admin do
			admin true
		end

		factory :tester do
			tester true
		end

		factory :components do
			components_allowed true
		end
	end

	factory :micropost do
		content "Lorem ipsum"
		user
	end

	factory :item do
		name "Old Laptop"
		user
	end

	factory :quest do
		name "The Quest"
		qtype "QA"
	end

	factory :experience do
		name "Experience"
		user
		quest
	end
end