require_relative 'array_sorter'

module SortingSuite
  class InsertionSort
    include ArraySorter

    def initialize(array = nil)
      handle_array(array)
    end

    def sort_logic(array)
      ordered_array = []
      @array.each do |number|
        place = nil
        ordered_array.each do |ordered_number|
          if number < ordered_number
            place = ordered_array.index(ordered_number)
            break
          end
        end
        ordered_array.insert(place, number) if place

        ordered_array << number unless place
      end
      ordered_array
    end

    def sort!(array = nil)
      inplace_sort(array)
    end

    def inplace_sort(array = nil)
      handle_array(array)

      1.upto(@array.size - 1) do |count|
        count.times do |pos|
          if @array[count] < @array[pos]
            @array.insert(pos, @array.delete_at(count))
          end
        end
      end

      @array
    end
  end
end
