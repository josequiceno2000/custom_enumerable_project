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
