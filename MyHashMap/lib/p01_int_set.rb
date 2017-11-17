require 'byebug'
class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true 
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num <= @max && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if self.include?(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(num) #49
    return false if self.include?(num)
    self[num] << num
    @count += 1
    if @count > @store.length 
      resize! 
    end 
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  protected

  def [](num)
    @store[num % num_buckets] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten
    @store = Array.new(num_buckets * 2) {Array.new}
    old_store.each do |num|
      self[num] << num 
    end 
    
  end
  
end
