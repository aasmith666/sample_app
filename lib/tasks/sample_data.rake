require 'faker'

namespace :db do

	describe "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		User.create!(	:name => "Example User",
						:email => "example@railstutorial.org",
						:password => "ratfink666",
						:password_confirmation => "ratfink666")
		99.times do |n|
			name = Faker::Name.name
			email = "test666-#{n+1}@gmail.com"
			password = "password"
			User.create!(:name => name,
						:email => email,
						:password => password,
						:password_confirmation => password)
		end
	end

end
