FactoryBot.define do
	factory :blog do
		title { "title" }
		body { "body" }
		category { rand(0..5) }
		map { "map"}

		association :user
	end
end