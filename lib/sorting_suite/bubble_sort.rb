module SortingSuite
  class BubbleSort
    def sort(array)
      swap = true
      while swap
        swap = false

        array.size.times do |pos|
          if array[pos + 1] && array[pos + 1] < array[pos]
            aux = array[pos + 1]
            array[pos + 1] = array[pos]
            array[pos] = aux
            swap = true
          end
        end
      end
      array
    end
  end
end

sorter = SortingSuite::BubbleSort.new
sorter.sort([4, 2, 5, 3, 1,34,6])
