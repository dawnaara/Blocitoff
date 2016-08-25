require 'faker'

	# create users
	10.times do
		User.create!( 
			first_name: Faker::Name.name,
			last_name: Faker::Name.name,
			email: Faker::Internet.email,
			password: Faker::Internet.password(6), 
			confirmed_at: Time.now
		)
	end

	users = User.all

	# create items
	100.times do
		Item.create!(
			name: Faker::Name.title,
			user: users.sample
		) 
	end

	puts "#{User.count} users created"
	puts "#{Item.count} items created"
