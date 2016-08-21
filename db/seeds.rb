require 'faker'


	# create users
	10.times do
		user = User.create!( 
			:name => "#{Name.name}",
			:email => "#{Internet.email}",
			:password => "#{Internet.password}"
		)
		puts user.inspect
	end

