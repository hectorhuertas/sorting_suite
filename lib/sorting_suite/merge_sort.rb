require_relative 'array_sorter'

module SortingSuite
  class MergeSort
    include ArraySorter

    def initialize(array = nil)
      handle_array(array)
    end

    def sort_logic(array)
      if array.size == 1 || array.empty?
        return array
      else
        first_half = sort_logic(array.take(array.size / 2))
        second_half = sort_logic(array.slice((array.size / 2)..-1))
        ordered_array = []

        while first_half.any? && second_half.any?
          if first_half.first < second_half.first
            ordered_array << first_half.shift
          else
            ordered_array << second_half.shift
          end
        end

        if first_half.empty?
          ordered_array += second_half
        else
          ordered_array += first_half
        end

        array.replace(ordered_array)
      end
    end
  end
end
