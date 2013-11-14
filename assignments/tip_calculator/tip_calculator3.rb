#! /bin/ruby

# my project of tip calculator version 2.0
# Author: limingth@gmail.com
# Date:   11/14/2013

def calculate(base, rate)
	return base * rate
end

# the base price of the meal
puts "Enter the cost of your meal before tax: "
# meal = 20.00
input = gets.chomp
meal = Float(input)

# the tax rate for the meal
puts "Enter the rate of your local tax: "
# tax = 0.12
input = gets.chomp
tax = Float(input) / 100

# the tip rate for the meal
puts "Enter the rate you'd like to tip: "
# tip = 0.20
input = gets.chomp
tip = Float(input) / 100

tax_value = calculate(meal, tax)
meal_with_tax = meal + tax_value
tip_value = calculate(meal_with_tax, tip) 
total_cost = meal_with_tax + tip_value

=begin
print "The pre-tax cost of your meal was $#{meal}\n"
print "At #{tax*100}%, tax for this meal is $#{tax_value}\n"
print "For a #{tip*100}% tip, you should leave $#{tip_value}\n"
print "The grand total for this meal is then $#{total_cost}\n"
=end

print "The pre-tax cost of your meal was $%.2f\n" % meal
print "At %d%%, tax for this meal is $%.2f\n" % [tax*100, tax_value]
print "For a %d%% tip, you should leave $%.2f\n" % [tip*100, tip_value]
print "The grand total for this meal is then $%.2f\n" % total_cost

