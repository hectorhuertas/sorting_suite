require_relative 'bubble_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'
require_relative 'selection_sort'

module SortingSuite
  class Benchmark
    attr_reader :array
    def initialize(array=nil)
      handle_array(array)
    end

    def handle_array(array)
      if array.nil?
        @array ||= []
      else
        @array = array
      end
    end

    def measure_time(sorter_class, array = nil)
      handle_array(array)

      sorter = sorter_class.new

      starting_time = Time.now
      sorter.sort(@array.dup)
      duration = Time.now - starting_time

      { sorter_class => duration }
    end

    def time(sorter_class, array = nil)
      handle_array(array)

      benchmark_result = measure_time(sorter_class)

      sorter_name = benchmark_result.keys.first.name.split('::').last
      sorter_time = benchmark_result.values.last
      "#{sorter_name} took #{'%f' % sorter_time} seconds"
    end

    def sorters
      module_members = SortingSuite.constants
      module_members.delete_if { |member| member.to_s.slice(-4..-1) != 'Sort' }
    end

    def run_all(array = nil)
      handle_array(array)

      result = {}
      sorters.each do |sorter|
        sorter_class = Object.const_get('SortingSuite::' + sorter.to_s)
        result[sorter] = measure_time(sorter_class).values.first
      end

      result
    end

    def pick_fastest(sorters_times)
      sorters_times.key(sorters_times.values.min)
    end

    def pick_slowest(sorters_times)
      sorters_times.key(sorters_times.values.max)
    end

    def fastest(array = nil)
      handle_array(array)

      fastest_sorter = pick_fastest(run_all)

      "#{fastest_sorter} is the fastest"
    end

    def slowest(array = nil)
      handle_array(array)

      slowest_sorter = pick_slowest(run_all)

      "#{slowest_sorter} is the slowest"
    end
  end
end
