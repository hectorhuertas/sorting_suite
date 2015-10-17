require 'sorting_suite/bubble_sort'
require 'sorting_suite/insertion_sort'
require 'sorting_suite/merge_sort'
module SortingSuite
class Benchmark
  attr_reader :array
  attr_reader :sorter_class

  def time(sorter_class,array=nil)
    if array.nil?
      @array||=[]
    else
      @array=array
    end
    @sorter_class=sorter_class
  end
end
end
