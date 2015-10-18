module SortingSuite
  class InsertionSort
    def initialize(array=nil)
      @array=array
    end
    def sort(array_in=nil)
      if array_in.nil?
        @array||=[]
      else
        @array=array_in
      end
      ordered_array = []
      @array.each do |number|
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

    def inplace_sort(array=nil)
      if array.nil?
        @array||=[]
      else
        @array=array
      end
      1.upto(@array.size()-1) do |count|

        count.times do |pos|
          if @array[count] < @array[pos]
            # array.delete_at(count)
            @array.insert(pos,@array.delete_at(count)   )
          end

        end

      end

      @array
    end
  end
end

sorter = SortingSuite::InsertionSort.new
sorter.sort([4, 2, 6, 1])
sorter.inplace_sort([5, 2, 6, 1])
array=[5, 2, 6, 1]
SortingSuite::InsertionSort.new(array).inplace_sort.object_id == array.object_id
