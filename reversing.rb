#!/usr/bin/env ruby

puts"This program takes a user input string and gives back the string reversed."

print"What would you like to reverse? "

input=gets.chomp

input.reverse!

puts input
