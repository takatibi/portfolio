FactoryBot.define do
	factory :user do
		name { "name"}
		introduction {"maximum: 100"}
		email { "email@email2" }
		password { "password" }
		password_confirmation { "password" }
	end
end