require 'sorting_suite/bubble_sort'
require 'sorting_suite/insertion_sort'
require 'sorting_suite/merge_sort'
module SortingSuite
class Benchmark
  attr_reader :array

  def time(sorter_class,array=nil)
    if array.nil?
      @array||=[]
    else
      @array=array
    end

    array_to_sort =@array.map{|x| x}

    sorter=sorter_class.new
    starting_time = Time.now
    sorter.sort(array_to_sort)
    duration = Time.now - starting_time

    "#{sorter.class.name.split('::').last} took #{duration *1000} seconds"

  end

  def run_all(array=nil)
    result={}
    sorters=SortingSuite.constants.map{|x|x unless x==:Benchmark}.compact
    sorters.each do |sorter|
      result[sorter]=time(Object.const_get("SortingSuite::"+sorter.to_s),array).scan(/[0-9]./).join.to_f

    end
    p 'run all'
    p result
    # p sorters.size
  end

  def fastest_logic(sorters_times)
    sorters_times.key(sorters_times.values.min)
  end

  def slowest_logic(sorters_times)
    sorters_times.key(sorters_times.values.max)
  end

  def fastest(array=nil)
    if array.nil?
      @array||=[]
    else
      @array=array
    end
    @array
  end

  def slowest(array=nil)
    if array.nil?
      @array||=[]
    else
      @array=array
    end
  end
end
end
