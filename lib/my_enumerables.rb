module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |element|
      return false unless yield(element)
    end

    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end

    false
  end

  def my_count
    count = 0
    
    if block_given?
      self.my_each { |element| count +=1 if yield(element) }
    else
      self.my_each { count += 1 }
    end
    
    count
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    self.my_each do |element|
      yield(element, i)
      i += 1
    end

    self
  end

  def my_inject(initial_value)
    accumulator = initial_value

    self.my_each do |element|
      accumulator = yield(accumulator, element)
    end

    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for i in 0...self.length
      yield(self[i])
    end

    self
  end
end
