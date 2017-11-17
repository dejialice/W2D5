require 'byebug'
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |el, idx|
      result += (el * (idx + 1))
    end
    result
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a
    result = 0
    letters = self.downcase.chars
    letters.each_with_index do |letter, i|
      result += (alphabet.index(letter) * i)
    end 
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alphabet = ('a'..'z').to_a
    result = []
    self.each do |k, v| 
      result << v
    end
    sum = 0
    result.each_with_index do |v, i|
      if result[i].is_a?(Integer)
        sum += v * i
      elsif result[i].is_a?(String)
        sum += alphabet.index(v) + i
      end
    end
    sum
  
  end
end
