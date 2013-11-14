#! /bin/ruby

# my project of tip calculator version 1.0
# Author: limingth@gmail.com
# Date:   11/14/2013

# the base price of the meal
meal = 20.00

# the tax rate for the meal
tax = 0.12

# the tip rate for the meal
tip = 0.20

tax_value = meal * tax
meal_with_tax = meal + tax_value
tip_value = meal_with_tax * tip
total_cost = meal_with_tax + tip_value

print "The pre-tax cost of your meal was $%.2f\n" % meal
print "At %d%%, tax for this meal is $%.2f\n" % [tax*100, tax_value]
print "For a %d%% tip, you should leave $%.2f\n" % [tip*100, tip_value]
print "The grand total for this meal is then $%.2f\n" % total_cost

