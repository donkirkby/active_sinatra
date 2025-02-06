value = ENV.fetch('EXAMPLE_VALUE', 'not set')
puts "example value is #{value.inspect}."

value2 = ENV.fetch('EXAMPLE_VALUE2', 'not set')
puts "example value 2 is #{value2.inspect}."

value3 = ENV.fetch('EXAMPLE_VALUE3', 'not set')
puts "example value 3 is #{value3.inspect}."
