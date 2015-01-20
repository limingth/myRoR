# my josephus.rb 
# Ming Li <limingth@gmail.com>
# 2014-01-19

n = 6 # n is total people like 6 
m = 3 # m is count to which number like 3
k = 1 # k is from where like 1

# init people array
people = (1..n).to_a 

# init i as a cursor
i = k - 1

# init counter from 0
counter = 0

# main loop
while people.length > 0
  counter += 1
  print "#{people[i]}\n"

  # if counter to m, someone is out
  if counter == m
    print "--> #{people[i]} is out\n"
    people.delete_at(i)
    i -= 1
    counter = 0
  end

  # if counter to last one, then begin from 0
  i += 1
  if i == people.length 
    i = 0 
  end
    
  sleep 1
end
