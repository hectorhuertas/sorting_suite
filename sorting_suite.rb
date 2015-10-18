require_relative 'lib/sorting_suite/benchmark'                    # => true
puts 'Hello, Sorting Suite! -> Observe with seeing-is-believing'  # => nil

sorter=SortingSuite::BubbleSort.new(%w(d k e i a x b))  # => #<SortingSuite::BubbleSort:0x007fee13892200 @array=["d", "k", "e", "i", "a", "x", "b"]>
sorter.array                                            # => ["d", "k", "e", "i", "a", "x", "b"]
sorter.sort                                             # => ["a", "b", "d", "e", "i", "k", "x"]
sorter.array                                            # => ["d", "k", "e", "i", "a", "x", "b"]
sorter.sort!                                            # => ["a", "b", "d", "e", "i", "k", "x"]
sorter.array                                            # => ["a", "b", "d", "e", "i", "k", "x"]

sorter = SortingSuite::InsertionSort.new([5, 2, 6, 1])  # => #<SortingSuite::InsertionSort:0x007fee138914b8 @array=[5, 2, 6, 1]>
sorter.array                                            # => [5, 2, 6, 1]
sorter.sort                                             # => [1, 2, 5, 6]
sorter.array                                            # => [5, 2, 6, 1]
sorter.sort!                                            # => [1, 2, 5, 6]
sorter.array                                            # => [1, 2, 5, 6]
array = [5, 2, 6, 1]                                    # => [5, 2, 6, 1]
sorter.array                                            # => [1, 2, 5, 6]
sorter.inplace_sort([5, 2, 6, 1])                       # => [1, 2, 5, 6]

SortingSuite::InsertionSort.new(array).inplace_sort.object_id == array.object_id  # => true


sorter=SortingSuite::MergeSort.new(%w(d k e i a x b))  # => #<SortingSuite::MergeSort:0x007fee138901a8 @array=["d", "k", "e", "i", "a", "x", "b"]>
sorter.array                                           # => ["d", "k", "e", "i", "a", "x", "b"]
sorter.sort                                            # => ["a", "b", "d", "e", "i", "k", "x"]
sorter.array                                           # => ["d", "k", "e", "i", "a", "x", "b"]
sorter.sort!                                           # => ["a", "b", "d", "e", "i", "k", "x"]
sorter.array                                           # => ["a", "b", "d", "e", "i", "k", "x"]

sorter=SortingSuite::SelectionSort.new(%w(d k e i a x b))  # => #<SortingSuite::SelectionSort:0x007fee1388a370 @array=["d", "k", "e", "i", "a", "x", "b"]>
sorter.array                                               # => ["d", "k", "e", "i", "a", "x", "b"]
sorter.sort                                                # => ["a", "b", "d", "e", "i", "k", "x"]
sorter.array                                               # => ["d", "k", "e", "i", "a", "x", "b"]
sorter.sort!                                               # => ["a", "b", "d", "e", "i", "k", "x"]
sorter.array                                               # => ["a", "b", "d", "e", "i", "k", "x"]

# >> Hello, Sorting Suite! -> Observe with seeing-is-believing
