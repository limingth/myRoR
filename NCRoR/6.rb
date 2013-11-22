# print 9x9 table

for i in 1..9
	for j in 1..i
		#print "#{i}*#{j}=#{i*j} "
		print "%1d*%1d=%-2d " % [j, i, i*j]
	end
	print "\n"
end
