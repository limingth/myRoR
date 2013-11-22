# calculate distance

def get_point
	print "input first point like 4 4 \n"
	p = gets.chomp.split

	until p.length == 2
		puts "only 2 num is ok, please reinput:\n"
		p = gets.chomp.split
	end

	#print "user input point is #{p[0]}, #{p[1]}\n"
	return [p[0].to_i, p[1].to_i]
end

p1 = get_point
print "first point is #{p1[0]}, #{p1[1]}, #{p1[2]}\n"

p2 = get_point
print "second point is #{p2[0]}, #{p2[1]}, #{p2[2]}\n"

print "first point is #{p1[0]}, #{p1[1]}, #{p1[2]}\n"

distance1 = p2[0]-p1[0]
puts distance1

distance2 = p2[1]-p1[1]
puts distance2

print "from #{p1} to #{p2} is [#{distance1}, #{distance2}]\n"
