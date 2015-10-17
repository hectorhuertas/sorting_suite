require_relative 'lib/sorting_suite/merge_sort'
puts 'Hello, Sorting Suite!'
sorter = SortingSuite::MergeSort.new
p sorter.sort(["d", "b", "a", "c"])
