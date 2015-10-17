module SortingSuite
  class MergeSort
    def sort(array_in)
      if array_in.size == 1 || array_in.empty?
        return array_in
      else
        first_half = sort(array_in.take(array_in.size / 2))
        second_half = sort(array_in.slice((array_in.size / 2)..-1))
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

        ordered_array
      end
    end
  end
end
