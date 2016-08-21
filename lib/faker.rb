module faker 
	def name
     	letters = ('a'..'z').to_a
     	letters.shuffle!
     	letters[0,rand(3..8)].join	
	end 
end