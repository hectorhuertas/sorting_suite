require 'minitest'
require 'sorting_suite/benchmark'

class BenchmarkTest < Minitest::Test
  def test_benchmark_exists
    benchmark=SortingSuite::Benchmark.new
    assert benchmark
  end

  def test_time_uses_given_or_existing_or_empty_array
    benchmark=SortingSuite::Benchmark.new

    benchmark.time(SortingSuite::MergeSort)
    assert_equal [],benchmark.array

    benchmark.time(SortingSuite::BubbleSort,[3,1,4,2])
    assert_equal [3,1,4,2],benchmark.array

    benchmark.time(SortingSuite::InsertionSort)
    assert_equal [3,1,4,2],benchmark.array

    benchmark.time(SortingSuite::MergeSort,%w(o e d k a c l d i))
    assert_equal %w(o e d k a c l d i),benchmark.array
  end

  def test_time_calls_given_sorter
    benchmark=SortingSuite::Benchmark.new

    benchmark.time(SortingSuite::MergeSort)
    assert_equal SortingSuite::MergeSort,benchmark.sorter_class

    benchmark.time(SortingSuite::InsertionSort)
    assert_equal SortingSuite::InsertionSort,benchmark.sorter_class
  end

  def test_time_returns_sorting_time
    skip
  end

  def test_fastest_uses_given_or_existing_or_empty_array
    skip
  end

  def test_fastest_calls_every_sorter
    skip
  end

  def test_fastest_returns_faster_sorter_data
    skip
  end

  def test_slowest_uses_given_or_existing_or_empty_array
    skip
  end

  def test_slowest_calls_every_sorter
    skip
  end

  def test_slowest_returns_slower_sorter_data
    skip
  end
end
