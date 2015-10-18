module SortingSuite
  class InsertionSort
    def sort(array_in)
      ordered_array = []                                 # => []
      array_in.each do |number|                          # => [4, 2, 6, 1]
        inserted = false                                 # => false, false, false, false
        place = nil                                      # => nil, nil, nil, nil
        ordered_array.each do |ordered_number|           # => [], [4], [2, 4], [2, 4, 6]
          if number < ordered_number                     # => true, false, false, true
            inserted = true                              # => true, true
            place = ordered_array.index(ordered_number)  # => 0, 0
            break
          end
        end                                              # => [], nil, [2, 4], nil
        ordered_array.insert(place, number) if place     # => nil, [2, 4], nil, [1, 2, 4, 6]

        ordered_array << number unless inserted  # => [4], nil, [2, 4, 6], nil
      end                                        # => [4, 2, 6, 1]
      ordered_array                              # => [1, 2, 4, 6]
    end

    def inplace_sort(array)
      # array.size.times do |pos|
      #   base=array[pos]
      #   (array.size()-(pos-1))
      #   (array.size()-(pos-1)).times do |pos2|
      #     array[pos]
      #     array[(pos2+1)]
      #     if array[pos]<array[(pos2+1)]
      #       puts 'swap'
      #     end
      #   end
      1.upto(array.size()-1) do |count|                  # => 1
        count                                            # => 1, 2, 3
        count.times do |pos|                             # => 1, 2, 3
          if array[count] < array[pos]                   # => true, false, false, true, false, false
            # array.delete_at(count)
            array.insert(pos,array.delete_at(count)   )  # => [2, 5, 6, 1], [1, 2, 5, 6]
          end                                            # => [2, 5, 6, 1], nil, nil, [1, 2, 5, 6], nil, nil

        end  # => 1, 2, 3

      end  # => 1
      #
      #
      #
      #
      # end


      array  # => [1, 2, 5, 6]
    end
  end
end

sorter = SortingSuite::InsertionSort.new                                         # => #<SortingSuite::InsertionSort:0x007fbce20cb380>
sorter.sort([4, 2, 6, 1])                                                        # => [1, 2, 4, 6]
sorter.inplace_sort([5, 2, 6, 1])                                                # => [1, 2, 5, 6]
# SortingSuite::InsertionSort.new([5, 2, 6, 1]).sort.object_id == array.object_id  # ~> ArgumentError: wrong number of arguments (1 for 0)

# ~> ArgumentError
# ~> wrong number of arguments (1 for 0)
# ~>
# ~> /Users/hectorhuertas/turing/1module/projects/sorting_suite/lib/sorting_suite/insertion_sort.rb:59:in `initialize'
# ~> /Users/hectorhuertas/turing/1module/projects/sorting_suite/lib/sorting_suite/insertion_sort.rb:59:in `new'
# ~> /Users/hectorhuertas/turing/1module/projects/sorting_suite/lib/sorting_suite/insertion_sort.rb:59:in `<main>'
