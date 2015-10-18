module SortingSuite
  module ArraySorter
    attr_reader :array
    def handle_array(array)
      if array.nil?
        @array ||= []
      else
        @array = array
      end
    end

    def sort(array = nil)
      handle_array(array)
      sort_logic(@array.dup)
    end

    def sort!(array = nil)
      handle_array(array)
      sort_logic(@array)
    end
  end
end
