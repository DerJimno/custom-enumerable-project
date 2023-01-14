require_relative '../my_enumerables'
print "Press enter to move on to #my_each tests for Arrays"
gets
system('clear') || system('cls')


puts 'Testing #each for Arrays'
arr = [1, 2, 3, 4]
arr2 = [12, 27, 1, 99, 12, 'a']
arr3 = ['testing', :are_we_sure, 'this', [5, 6], 'works', Random.new]

puts 'Array 1'
p arr.each
p arr.my_each
puts 'Testing #each block, output should be duplicated'
p arr.each { |item| p item }
p arr.my_each { |item| p item }

puts '=================='
puts 'Array 2'
p arr2.each
p arr2.my_each
puts 'Testing #each block, output should be duplicated'
p arr2.each { |item| p item }
p arr2.my_each { |item| p item }

puts '=================='
puts 'Array 3'
p arr3.each
p arr3.my_each
puts 'Testing #each block, output should be duplicated'
p arr3.each { |item| p item }
p arr3.my_each { |item| p item }




puts " "
print "Press enter to move on to #my_each tests for Hashes"
gets
system('clear') || system('cls')





puts 'Testing #each for Hashes'
hash = { a: 1, b: 2, c: 3 }
hash2 = {a: 12, b: 27, c:1, d: 99, e: 12, f: 'a'}
hash3 = {a: 'testing',b: :are_we_sure, c: 'this', d: [5, 6], e: 'works', f: Random.new}

puts 'Hash 1 Testing values!'
p hash.each
p hash.my_each
puts 'Testing #each block, output should be duplicated'
p hash.each { |key, val| p val }
p hash.my_each { |key, val| p val }

puts '=================='
puts 'Hash 2 Testing keys!'
p hash2.each
p hash2.my_each
puts 'Testing #each block, output should be duplicated'
p hash2.each { |key, val| p key }
p hash2.my_each { |key, val| p key }

puts '=================='
puts 'Hash 3 Combination!'
p hash3.each
p hash3.my_each
puts 'Testing #each block, output should be duplicated'
p hash3.each { |key, val| p "#{key} value is #{val}" }
p hash3.my_each { |key, val| p "#{key} value is #{val}"}




puts " "
print "Press enter to move on to #my_each_with_index tests for Arrays"
gets
system('clear') || system('cls')





puts 'Array 1'
p arr.each_with_index
p arr.my_each_with_index
p arr.each_with_index(1,2)
p arr.my_each_with_index(1,2)
puts 'Testing #each_with_index block, output should be duplicated'
p arr.each_with_index { |item, index| puts "#{index}: #{item}" }
p arr.my_each_with_index { |item, index| puts "#{index}: #{item}" }

puts '=================='
puts 'Array 2'
p arr2.each_with_index
p arr2.my_each_with_index
p arr2.each_with_index(1,2)
p arr2.my_each_with_index(1,2)
puts 'Testing #each_with_index block, output should be duplicated'
p arr2.each_with_index { |item, index| puts "#{index}: #{item}" }
p arr2.my_each_with_index { |item, index| puts "#{index}: #{item}" }

puts '=================='
puts 'Array 3'
p arr3.each_with_index
p arr3.my_each_with_index
p arr3.each_with_index(1,2)
p arr3.my_each_with_index(1,2)
puts 'Testing #each_with_index block, output should be duplicated'
p arr3.each_with_index { |item, index| puts "#{index}: #{item}" }
p arr3.my_each_with_index { |item, index| puts "#{index}: #{item}" }



puts " "
print "Press enter to move on to #my_each_with_index tests for Hashes"
gets
system('clear') || system('cls')






puts 'Hash 1 Testing index!'
p hash.each_with_index
p hash.my_each_with_index
p hash.each_with_index(1,2)
p hash.my_each_with_index(1,2)
puts 'Testing #each_with_index block, output should be duplicated'
p hash.each_with_index { |el, index| puts index }
p hash.my_each_with_index { |el, index| puts index}

puts '=================='
puts 'Hash 2 Testing element!'
p hash2.each_with_index
p hash2.my_each_with_index
p hash2.each_with_index(1,2)
p hash2.my_each_with_index(1,2)
puts 'Testing #each_with_index block, output should be duplicated'
p hash2.each_with_index { |el, index| p el }
p hash2.my_each_with_index { |el, index| p el }

puts '=================='
puts 'Hash 3 Combination!'
p hash3.each_with_index
p hash3.my_each_with_index
p hash3.each_with_index(1,2)
p hash3.my_each_with_index(1,2)
puts 'Testing #each_with_index block, output should be duplicated'
p hash3.each_with_index { |el, index| puts "#{index}: #{el}" }
p hash3.my_each_with_index { |el, index| puts "#{index}: #{el}" }




puts ' '
print 'Press enter to move on to #my_all? Arrays'
gets
system('clear') || system('cls')




puts 'There should be 6 true evaluations, as each line runs built in all against my_all and checks if results are equal'
print 'Words >= 3 length: '.ljust(21, ' ')
p %w[ant bear cat].all? { |word| word.length >= 3 } == %w[ant bear cat].my_all? { |word| word.length >= 3 }
print 'Words >=4 length: '.ljust(21, ' ')
p %w[ant bear cat].all? { |word| word.length >= 4 } == %w[ant bear cat].my_all? { |word| word.length >= 4 }
print 'All regex /t/: '.ljust(21, ' ')
p %w[ant bear cat].all?(/t/) == %w[ant bear cat].my_all?(/t/)
print 'All numeric?: '.ljust(21, ' ')
p [1, 2i, 3.14].all?(Numeric) == [1, 2i, 3.14].my_all?(Numeric)
print 'No block or param: '.ljust(21, ' ')
p [nil, true, 99].all? == [nil, true, 99].my_all?
print 'Empty array '.ljust(21, ' ')
p [].all? == [].my_all?




puts ' '
print 'Press enter to move on to #my_all? tests for Hashes'
gets
system('clear') || system('cls')

hash_one = {a: "ant", b: "bear", c: "cat"}


puts 'There should be 5 true evaluations, as each line runs built in all against my_all and checks if results are equal'
print 'Value >= 3 length: '.ljust(21, ' ')
p hash_one.all? { |key, val| val.length >= 3 } == hash_one.my_all? { |key, val| val.length >= 3 }
print 'Value >= 4 length: '.ljust(21, ' ')
p hash_one.all? { |key, val| val.length >= 4 } == hash_one.my_all? { |key, val| val.length >= 4 }
print 'Key == Symbol : '.ljust(21, ' ')
p hash_one.all? { |key, val| Symbol === key } == hash_one.my_all? { |key, val| Symbol === key }
print 'Value == String: '.ljust(21, ' ')
p hash_one.all? { |key, val| String === val} == hash_one.my_all? { |key, val|  String === val}
print 'Empty Hash '.ljust(21, ' ')
a = {}.all?
b = {}.my_all?
p a === b


puts ' '
print 'Press enter to move on to #my_any? tests for Arrays'
gets
system('clear') || system('cls')




puts 'Like before, there should be 6 true evaluations below.'
print 'Words >= 3 length: '.ljust(21, ' ')
p %w[ant bear cat].any? { |word| word.length >= 3 } == %w[ant bear cat].my_any? { |word| word.length >= 3 }
print 'Words >= 4 length: '.ljust(21, ' ')
p %w[ant bear cat].any? { |word| word.length >= 4 } == %w[ant bear cat].my_any? { |word| word.length >= 4 }
print 'Any digits?: '.ljust(21, ' ')
p %w[ant bear cat].any?(/d/) == %w[ant bear cat].my_any?(/d/)
print 'Any Integer? '.ljust(21, ' ')
p [nil, true, 99].any?(Integer) == [nil, true, 99].my_any?(Integer)
print 'Any bool and int? '.ljust(21, ' ')
p [nil, true, 99].any? == [nil, true, 99].my_any?
print 'Any, empty array'.ljust(21, ' ')
p [].any? == [].my_any?




puts ' '
print 'Press enter to move on to #my_any? tests for Hashes'
gets
system('clear') || system('cls')



puts 'There should be 5 true evaluations below.'
print 'Value >= 3 length: '.ljust(21, ' ')
p hash_one.any? { |key, val| val.length >= 3 } == hash_one.my_any? { |key, val| val.length >= 3 }
print 'Value >= 4 length: '.ljust(21, ' ')
p hash_one.any? { |key, val| val.length >= 4 } == hash_one.my_any? { |key, val| val.length >= 4 }
print 'Key == Symbol : '.ljust(21, ' ')
p hash_one.any? { |key, val| Symbol === key } == hash_one.my_any? { |key, val| Symbol === key }
print 'Value == String: '.ljust(21, ' ')
p hash_one.any? { |key, val| String === val} == hash_one.my_any? { |key, val|  String === val}
print 'Any, empty Hash'.ljust(21, ' ')
a = {}.any?
b = {}.my_any?
p a === b




puts ' '
print 'Press enter to move on to #my_none? tests for Arrays'
gets
system('clear') || system('cls')

puts 'There should be 8 true evaluations below.'

print 'No words ==5 length: '.ljust(21, ' ')
p %w{ant bear cat}.none? { |word| word.length == 5 } == %w{ant bear cat}.my_none? { |word| word.length == 5 }
print 'No words >=4 length: '.ljust(21, ' ')
p %w{ant bear cat}.none? { |word| word.length >= 4 } == %w{ant bear cat}.my_none? { |word| word.length >= 4 }
print 'No digits: '.ljust(21, ' ')
p %w{ant bear cat}.none?(/d/) == %w{ant bear cat}.my_none?(/d/)
print 'No floats: '.ljust(21, ' ')
p [1, 3.14, 42].none?(Float) == [1, 3.14, 42].my_none?(Float)
print 'Empty array: '.ljust(21, ' ')
p [].none? == [].my_none?
print '1 nil: '.ljust(21, ' ')
p [nil].none? == [nil].my_none?
print 'Falsey values: '.ljust(21, ' ')
p [nil, false].none? == [nil, false].my_none?
print 'Nil plus bools: '.ljust(21, ' ')
p [nil, false, true].none? == [nil, false, true].my_none?




puts ' '
print 'Press enter to move on to #my_none? tests for Hashes'
gets
system('clear') || system('cls')

puts 'There should be 5 true evaluations below.'
print 'Value >= 5 length: '.ljust(21, ' ')
p hash_one.none? { |key, val| val.length >= 5 } == hash_one.my_none? { |key, val| val.length >= 5 }
print 'Value >= 4 length: '.ljust(21, ' ')
p hash_one.none? { |key, val| val.length >= 4 } == hash_one.my_none? { |key, val| val.length >= 4 }
print 'Key == Symbol : '.ljust(21, ' ')
p hash_one.none? { |key, val| Symbol === key } == hash_one.my_none? { |key, val| Symbol === key }
print 'Value == String: '.ljust(21, ' ')
p hash_one.none? { |key, val| String === val} == hash_one.my_none? { |key, val|  String === val}
print 'none, empty Hash'.ljust(21, ' ')
a = {}.none?
b = {}.my_none?
p a === b




puts ' '
print 'Press enter to move on to #my_count tests for Arrays'
gets
system('clear') || system('cls')

ary = [1, 2, 4, 2]

puts 'Should see 4 true evaluations.'

print 'Count, bare call: '.ljust(21, ' ')
p ary.count == ary.my_count
print 'Count, with item: '.ljust(21, ' ')
p ary.count(2) == ary.my_count(2)
print 'Count, block: '.ljust(21, ' ')
p ary.count{ |x| x.even? } == ary.my_count{ |x| x.even? }
print 'Count, symbol block: '.ljust(21, ' ')
p ary.count(&:odd?) == ary.my_count(&:odd?)




puts ' '
print 'Press enter to move on to #my_count tests for Hashes'
gets
system('clear') || system('cls')

hashy = {a: 1, b: 2, c: 4, d: 2}

puts 'Should see 3 true evaluations.'

print 'Count, bare call: '.ljust(21, ' ')
p hashy.count == hashy.my_count
print 'Count, with item: '.ljust(21, ' ')
results = hashy.count(2) == hashy.my_count(2)
p results
print 'Count, block: '.ljust(21, ' ')
p hashy.count{ |k,v| v.even? } == hashy.my_count{ |k,v| v.even? }



puts ' '
print 'Press enter to move on to #my_map tests'
gets
system('clear') || system('cls')

puts 'Should see two Enumerable objects with the same output, then two true evaluations'
p (1..4).map
p (1..4).my_map
p (1..4).map { |i| i*i } == (1..4).my_map { |i| i*i }
p (1..4).map { "cat" } == (1..4).my_map { "cat" }

puts ' '
print 'Press enter to move on to #my_inject tests'
gets
system('clear') || system('cls')

def multiply_els(input)
  input.my_inject(:*)
end

puts 'Should see 40, then 5 true evaluations'
print 'Outputs 40: '.ljust(25, ' ')
p multiply_els([2, 4, 5])
print 'Block sum: '.ljust(25, ' ')
p (5..10).inject { |sum, n| sum + n } == (5..10).my_inject { |sum, n| sum + n }
print 'Symbol multiply:'.ljust(25, ' ')
p (5..10).inject(1, :*) == (5..10).my_inject(1, :*)
print 'Block multiply: '.ljust(25, ' ')
p (5..10).inject(1) { |product, n| product * n } == (5..10).my_inject(1) { |product, n| product * n }
print 'Hash, block: '.ljust(25, ' ')
hsh = { a: 1, b: 2, c: 3 }
p hsh.inject(0) { |sum, (k, v)| sum + v } == hsh.my_inject(0) { |sum, (k, v)| sum + v }
print 'Longest word matches: '.ljust(25, ' ')
longest = %w{ cat sheep bear }.inject do |memo, word|
  memo.length > word.length ? memo : word
end

longest2 = %w{ cat sheep bear }.my_inject do |memo, word|
  memo.length > word.length ? memo : word
end

p longest == longest2