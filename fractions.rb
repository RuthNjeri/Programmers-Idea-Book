# Description: This project involves working with fractions. How do you add 1⁄3 + 1⁄5? Create a
# program that first asks the user which operation they want to do: add, subtract, multiply or divide
# and then asks for 1, 2 or more fractions to work with. The program prints out the result.
# Tips: Think about how you might divide up the fraction itself into its numerator and denominator.
# Many of the operations involve finding a common denominator, getting its reciprocal and
# possibly reducing a fraction to lowest terms. This would be much easier if you can isolate the
# numerator from its denominator. You could also do this using a custom fraction class.

# Fraction class
class Fraction
  attr_reader :operation, :values
  def initialize(operation, values)
    @operation = operation
    @values = values
  end

  def display
    answer = calculation()
    puts "The result is #{answer}"
  end

  def calculation
    case @operation
    when "1" , "add"
      add()
    when "2" , "subtract"
      subtract()
    when "3" , "multiply"
      multiply()
    when "4" , "divide"
      divide()
    end
  end

  def convert_to_float(value)
    numerator, denominator = value.split('/').map(&:to_f)
    numerator/denominator
  end

  def add
    sum = 0
    @values.map do |value|
      number = convert_to_float(value)
      sum += number
    end
    sum
  end

  def subtract
    sum = convert_to_float(@values[0])
    @values.shift()

    @values.map do |value|
      number = convert_to_float(value)
      sum -= number
    end
    sum
  end

  def multiply
    sum = 1
    @values.map do |value|
      number = convert_to_float(value)
      sum *= number
    end
    sum
  end

  def divide
    sum = convert_to_float(@values[0])
    @values.shift()

    @values.map do |value|
      number = convert_to_float(value)
      sum /= number
    end
    sum
  end
end



# Operations
puts "Hello, which operation would you like to perform?"
puts " 1. Add\n 2. Subtract\n 3. Mulitiply\n 4. Divide\n"
operation = gets.chomp.downcase

while !%w(add subtract multiply 1 2 3 4).include?(operation)
  puts "That is not in the choices. Enter either 1, 2, 3, 4 or Add, Subtract, Multiply, Divide"
  operation = gets.chomp.downcase
end

# Number of values
puts "How many fractions do you want to perform the operations on?"
number_of_values = gets.chomp.to_i
count = 1
values = []

while count <= number_of_values
  puts "Enter fraction #{count}"
  value = gets.chomp
  values << value
  count += 1
end

result = Fraction.new(operation, values)
result.display
