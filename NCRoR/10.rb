# Josephus ring problem

ALL=100
OUT=3

#people = [1,2,3,4,5,6]
people = (1..ALL).to_a

print people.length
for i in 1..people.length
	people[i-1] = i
end

for i in 1..people.length
	print people[i-1].to_s + "\n"
end

left = people.length
pos = 0
step = 0

while left > 0
	if people[pos] > 0
		step += 1
	end

	if step == OUT and people[pos] != 0
		print "#{people[pos]} out \n"
		people[pos] = 0
		left -= 1
	end

	pos += 1
	if pos == ALL
		pos = 0
	end

	if step == 3
		step = 0
	end
end

print "Game over\n"
