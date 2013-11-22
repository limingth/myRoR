# change a number to string

print "input a number: "
num = gets.chomp.to_i

print "your number is #{num}\n"
buf = ""

while num > 0
	rest = num % 10
	buf += rest.to_s
	#print "buf is #{buf}\n"
	num /= 10
end

buf = buf.reverse
print "buf is #{buf}\n"

