# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_all?' do
    context 'when all elements match the condition' do
      it 'returns true' do
        expect(enumerable.my_all? { |value| value > 0 }).to eq true
      end
    end

    context 'when any element does not match the condition' do
      it 'returns false' do
        expect(enumerable.my_all? { |value| value < 5 }).to eq false
      end
    end
  end
end

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_any?' do
    context 'when any element matches the condition' do
      it 'returns true' do
        expect(enumerable.my_any?(&:even?)).to eq true
      end
    end

    context 'when no element matches the condition' do
      it 'returns false' do
        expect(enumerable.my_any?(&:negative?)).to eq false
      end
    end
  end
end


RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_count' do
    context 'when not given a block' do
      it 'returns the size of the enumerable' do
        expect(enumerable.my_count).to eq enumerable.size
      end
    end

    context 'when given a block' do
      it 'returns the count of the elements that satisfy the condition' do
        expect(enumerable.my_count { |value| value > 5 }).to eq 4
        expect(enumerable.my_count { |value| value <= 5 }).to eq 5
        expect(enumerable.my_count { |value| value == 5 }).to eq 1
      end
    end
  end
end

RSpec.describe Array do
  subject(:array) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_each' do
    context 'when given a block' do
      it 'returns the original array' do
        my_each_results = array.my_each do |_element|
          # This should return the original array
          # no matter the contents of the block
        end

        expect(my_each_results).to eq(array)
      end

      it 'executes the block for each element' do
        my_each_results = []
        each_results = []

        array.my_each do |element|
          my_each_results << element * 2
        end

        array.each do |element|
          each_results << element * 2
        end

        expect(my_each_results).to eq(each_results)
      end
    end
  end
end

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_each_with_index' do
    context 'when given a block' do
      it 'returns the original enumerable' do
        my_each_with_index_results = enumerable.my_each_with_index do |_element|
          # This should return the original enumerable
          # no matter the contents of the block
        end

        expect(my_each_with_index_results).to eq(enumerable)
      end

      it 'executes the block for each element and index' do
        my_each_with_index_results = []
        each_with_index_results = []

        enumerable.my_each_with_index do |element, index|
          my_each_with_index_results << [element * 2, index * 2]
        end

        enumerable.each_with_index do |element, index|
          each_with_index_results << [element * 2, index * 2]
        end

        expect(my_each_with_index_results).to eq(each_with_index_results)
      end
    end
  end
end

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_inject' do
    it 'reduces an enumerable to a single value' do
      initial_value = 0
      # calculates the sum of the elements of the enumerable array
      expect(enumerable.my_inject(initial_value) { |sum, value| sum + value }).to eq 88
    end

    it 'can be used to calculate the product' do
      product = enumerable.my_inject(1) { |prod, value| prod * value }

      expect(product).to eq 2_227_680
    end

    it 'uses the initial value on the first iteration' do
      initial_value = 100

      # calculates the sum of the elements of the enumerable array plus the initial value
      expect(enumerable.my_inject(initial_value) { |sum, value| sum + value }).to eq 188
    end
  end
end

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_map' do
    context 'when given a block' do
      it 'returns an array by yielding to the block' do
        expect(enumerable.my_map { |value| value * 2 }).to eq([2, 2, 4, 6, 10, 16, 26, 42, 68])
      end

      it 'returns an array with the same size as the enumerable' do
        expect(enumerable.my_map { |value| value * 2 }.size).to eq enumerable.size
      end
    end

    context 'when called with &:symbol' do
      it 'returns an array calling the method that matches the symbol for each element' do
        expect(enumerable.my_map(&:odd?)).to eq([true, true, false, true, true, false, true, true, false])
      end
    end
  end
end

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_none?' do
    context 'when no elements match the condition' do
      it 'returns true' do
        expect(enumerable.my_none? { |value| value < 0 }).to eq true
      end
    end

    context 'when any element matches the condition' do
      it 'returns false' do
        expect(enumerable.my_none? { |value| value == 1 }).to eq false
      end
    end
  end
end


RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_select' do
    it 'returns only the values that match the condition' do
      expect(enumerable.my_select { |value| value > 10 }).to eq([13, 21, 34])
    end

    it 'filters values that do not match the condition' do
      expect(enumerable.my_select { |value| value > 10 }).not_to include(1, 2, 3, 5, 8)
    end

    context 'when no items match the condition' do
      it 'returns an empty array' do
        expect(enumerable.my_select { |value| value > 40 }).to eq([])
      end
    end
  end
end