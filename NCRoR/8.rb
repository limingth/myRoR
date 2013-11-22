# find how many 9

def find(num, digit)
	print "find function #{num}, #{digit}\n"
	counter = 0	
	
	while num > 0
		if num % 10 == digit
			counter += 1
		end
		num = num / 10
	end

	return counter 
end

sum = 0
for i in 1..100
	ret = find(i, 9)
	sum += ret
	print "ret = #{ret}\n"	
end

print "Total is #{sum}\n"
