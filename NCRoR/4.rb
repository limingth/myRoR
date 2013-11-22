# judge odd or even

puts "please input a number:"
num = gets.chomp

if num.to_i % 2 == 1 
	print "#{num} is odd\n"
else
	print "#{num} is even\n"
end
