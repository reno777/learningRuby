#!/usr/bin/env ruby

=begin
This is just a small simple program that encrypts the users input. There will be added functionallity in the future to decrypt the input as well.

Author::    Seth Rasmussen (Reno)
Copyright:: Copyright (c) 2016 Seth Rasmussen
License::   MIT
=end

#variables




#beginning
puts "This is a simple encryption program using a Caesar cipher."
puts " "
puts "Please enter what you would like to be encrypted: "
inputPhrase=gets.chomp
inputPhrase.downcase!
puts "Would you like to reverse your input before you encrypt? "
choice=gets.chomp
choice.downcase!

if choice=="yes"
  inputPhrase.reverse!
end

puts inputPhrase.capitalize

#This is still in development
