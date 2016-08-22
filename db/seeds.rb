require 'faker'

	# create users
	10.times do
		User.create!( 
			name: Faker::Name.name,
			email: Faker::Internet.email,
			password: Faker::Internet.password(6)
		)
	end

	# create items
	10.times do
		Item.create!(
			item: Faker:Code.item
			) 
	end
