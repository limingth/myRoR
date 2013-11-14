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

print "The pre-tax cost of your meal was $#{meal}\n"
print "At #{tax*100}%, tax for this meal is $#{tax_value}\n"
print "For a #{tip*100}% tip, you should leave $#{tip_value}\n"
print "The grand total for this meal is then $#{total_cost}\n"

