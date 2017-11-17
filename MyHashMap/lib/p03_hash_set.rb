require_relative 'p02_hashing'

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

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key) #49
    hashed = key.hash
    return false if self.include?(hashed)
    self[hashed] << num
    @count += 1
    if @count > @store.length 
      resize! 
    end 
  end

  def include?(key)
  end

  def remove(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
