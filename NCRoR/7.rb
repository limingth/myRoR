# find the max prime number

for i in 2..100
	counter = 0
	for j in 2..i-1
		if i % j == 0
			counter += 1
		end
	end

	if counter == 0
		print "#{i} is prime\n"	
	end
end
