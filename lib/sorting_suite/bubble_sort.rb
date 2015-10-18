require_relative 'array_sorter'

module SortingSuite
  class BubbleSort
    include ArraySorter

    def initialize(array = nil)
      handle_array(array)
    end

    def swap(array, pos)
      aux = array[pos + 1]
      array[pos + 1] = array[pos]
      array[pos] = aux
    end

    def sort_logic(array)
      continue = true
      while continue
        continue = false
        (array.size - 1).times do |pos|
          if array[pos + 1] < array[pos]
            swap(array, pos)
            continue = true
          end
        end
      end
      array
    end
  end
end
