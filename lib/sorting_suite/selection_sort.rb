require_relative 'array_sorter'

module SortingSuite
  class SelectionSort
    include ArraySorter

    def initialize(array = nil)
      handle_array(array)
    end

    def swap(array, pos, min)
      aux = min
      array[array.index(min)] = array[pos]
      array[pos] = min
    end

    def sort_logic(array)
      (array.size - 1).times do |pos|
        min = array[pos]
        array.slice((pos + 1)..-1).each do |value|
          min = value if value < min
        end
        swap(array, pos, min) if min < array[pos]
      end

      array
    end
  end
end
