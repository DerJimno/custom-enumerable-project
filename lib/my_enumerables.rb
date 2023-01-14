module Enumerable
  # Define my_each_with_index:
  def my_each_with_index(*para)
    index = 0
    if block_given?
      self.my_each do |el|
        yield(el, index)
        index += 1
      end
    else
      self.to_enum("my_each_with_index", *para)
    end
  end

  # Define my_select:
  def my_select
    array = []
    self.my_each do |value|
      array << value if yield(value)
    end
    array
  end

  # Define my_all?
  def my_all?(para = nil)
    trues = []
    if block_given? && para != nil
      warn "#{__FILE__}:#{caller[0].scan(/\d+/)[0]}: warning: given block not used"
    end
    self.my_each do |value|
      if para != nil
        begin
          case para
            when Regexp then value.match(para) ? trues << true : nil
            else para === value ? trues << true : nil
          end
        rescue
        end
      else 
        if block_given?
          yield(value) ? trues << true : nil
        end
      end 
    end
    trues.length == self.size ? true : false
  end
  
  # Define my_any?
  def my_any?(para = nil)
    if block_given? && para != nil
      warn "#{__FILE__}:#{caller[0].scan(/\d+/)[0]}: warning: given block not used"
    end
    self.my_each do |value|
      if para != nil
        begin
          case para
          when Regexp
            if value.match(para)
              return true
              break
            end
          else 
            if para === value
              return true 
              break
            end
          end
          if value == self.last
            return false
          end
        rescue
        end
      else
        if block_given?
          if yield(value) == true
            return true
            break 
          elsif value == self.last
            return false
          end
        end
      end
    end
    if !block_given? && para == nil
      if self.length == 0 || self.my_all? {|el| el === nil || el === false}
        return false
      else
        return true
      end
    end
  end
  
  # Define my_none? (same logic as my_any?)
  def my_none?(para = nil)
    if block_given? && para != nil
      warn "#{__FILE__}:#{caller[0].scan(/\d+/)[0]}: warning: given block not used"
    end
    self.my_each do |value|
      if para != nil
        begin
          case para
          when Regexp
            if value.match(para)
              return false
              break
            end
          else 
            if para === value
              return false 
              break
            end
          end
          if value == self.last
            return true
          end
        rescue
        end
      else
        if block_given?
          if yield(value) == true
            return false
            break
          
          elsif value == self.last
            return true
          end
        end
      end
    end
    if !block_given? && para == nil
      if self.length == 0 || self.my_all? {|el| el === nil || el === false}
        return true
      else
        return false
      end
    end
  end

  # Define my_count 
  def my_count(para = nil)
    length = []
    if block_given? && para != nil
      warn "#{__FILE__}:#{caller[0].scan(/\d+/)[0]}: warning: given block not used"
    end
    if block_given?
      self.my_each do |value|
        length << value if yield(value)
      end
      length.length
    elsif para != nil || block_given? && para != nil
      self.my_each do |value|
        length << value if para === value
      end
      length.length
    else 
      length = self.length
    end
  end

  # Define my_map (this shows the diffrence between map and select)
  def my_map
    new_array= []
    if block_given?
      self.to_a.my_each do |value|
        new_array << yield(value)
      end
      new_array
    else
      self.to_enum("my_map")
    end
  end

  # Define my_inject (once you know something about the accumulator,
  # this becomes easy to understand)
  def my_inject(accumulator = 0, sym = nil)

    if block_given? && self.my_all?{|el| String === el}
      accumulator = ""
      self.my_each do |value|
        accumulator = yield(accumulator, value)
      end
    end
    if block_given? && self.my_all? {|el| Integer === el}
      self.to_a.my_each do |value|
        accumulator = yield(accumulator, value)
      end
    elsif Symbol === sym && !block_given?
      self.to_a.my_each do |value|
        accumulator = accumulator.send(sym, value)
      end
    end
    accumulator 
  end
end
# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each
  def my_each
    index = 0
    if block_given?
      until index == self.size do 
        yield(self[index])
        index += 1
      end
      self
    else
      self.to_enum("my_each")
    end
  end

  
end

class Hash
  # Define my_each for Hash class
  def my_each
    index = 0
    if block_given?
      until index == self.size do 
        yield(self.keys[index], self.values[index])
        index += 1
      end
      self
    else
      self.to_enum("my_each")
    end
  end

  # Define my_all? for Hash class
  def my_all?(para = (arg_not_passed = true; nil))
    trues = []
    if block_given? && !arg_not_passed
      warn "#{__FILE__}:#{caller[0].scan(/\d+/)[0]}: warning: given block not used"
    end
    if block_given? && arg_not_passed
      self.my_each do |key, value|
        yield(key, value) ? trues << true : nil
      end
      trues.length == self.size ? true : false
    # elsif !arg_not_passed
    #   if !self.empty? 
    #     case para 
    #     when Array then true
    #     else false
    #     end
    #   end
    elsif self.empty?
      return true
    end
  end

  # Define my_any? for Hash class
  def my_any?(para = (arg_not_passed = true; nil))
    if block_given? && !arg_not_passed
      warn "#{__FILE__}:#{caller[0].scan(/\d+/)[0]}: warning: given block not used"
    end
    if block_given? 
      self.my_each do |key, value|
        if yield(key, value) == true
          return true
          break
        end
        if value == self.values.last
          return false
        end
      end
    elsif self.empty?
      return false
    end
  end

  # Define my_none? for Hash class
  def my_none?(para = (arg_not_passed = true; nil))
    if block_given? && !arg_not_passed
      warn "#{__FILE__}:#{caller[0].scan(/\d+/)[0]}: warning: given block not used"
    end
    if block_given? 
      self.my_each do |key, value|
        if yield(key, value) == true
          return false
          break
        end
        if value == self.values.last
          return true
        end
      end
    # elsif para != nil
    #   if !self.empty? 
    #     case para
    #     when Array then false
    #     else true
    #     end
    #   end
    elsif self.empty?
      return true
    end
  end

  # Define my_count for Hash class 
  def my_count(para = nil)
    length = 0
    if block_given? && para != nil
      warn "#{__FILE__}:#{caller[0].scan(/\d+/)[0]}: warning: given block not used"
    end
    if block_given?
      self.my_each_with_index do |el, index|
        length += 1 if yield(el)
      end
      length
    elsif para != nil
      length
    else 
      length = self.length
    end
  end

  # Define my_inject for Hash class; why not
  def my_inject(accumulator = 0, sym = nil)
    if block_given?
      self.to_a.my_each_with_index do |key, value|
        accumulator = yield(accumulator, key, value)
      end
    end
    accumulator
  end
end

class Range
  # Define my_each for Range class ;) was needed for the tests.rb
  def my_each
    index = 0
    if block_given?
      until index == self.to_a.size do 
        yield(self.to_a[index])
        index += 1
      end
      self
    else
      self.to_enum("my_each")
    end
  end
end