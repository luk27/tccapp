require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Profile.create!(:nome => "Example User",
:sobrenome => "Sobrenome",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      nome  = Faker::Name.name
	sobrenome  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      Profile.create!(:nome => nome,
			:sobrenome => sobrenome,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
