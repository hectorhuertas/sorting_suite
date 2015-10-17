module SortingSuite
  class InsertionSort
    def sort(array_in)
      ordered_array = []
      array_in.each do |number|
        inserted = false
        place = nil
        ordered_array.each do |ordered_number|
          if number < ordered_number
            inserted = true
            place = ordered_array.index(ordered_number)
            break
          end
        end
        ordered_array.insert(place, number) if place

        ordered_array << number unless inserted
      end
      ordered_array
    end
  end
end

sorter = SortingSuite::InsertionSort.new
sorter.sort([4, 2, 6, 1])
