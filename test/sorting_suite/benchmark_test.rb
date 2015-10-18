require 'minitest'
require 'sorting_suite/benchmark'

class BenchmarkTest < Minitest::Test
  def test_benchmark_exists
    benchmark=SortingSuite::Benchmark.new
    assert benchmark
  end

  def test_time_uses_given_or_existing_or_empty_array
    benchmark=SortingSuite::Benchmark.new

    #none given, none existing
    benchmark.time(SortingSuite::MergeSort)
    assert_equal [],benchmark.array

    #array given, none existing
    benchmark.time(SortingSuite::BubbleSort,[3,1,4,2])
    assert_equal [3,1,4,2],benchmark.array

    #array given, array existing
    benchmark.time(SortingSuite::InsertionSort)
    assert_equal [3,1,4,2],benchmark.array

    #array given, none existing
    benchmark=SortingSuite::Benchmark.new
    benchmark.time(SortingSuite::MergeSort,%w(o e d k a c l d i))
    assert_equal %w(o e d k a c l d i),benchmark.array
  end

  def test_time_uses_given_sorter
    benchmark=SortingSuite::Benchmark.new

    result=benchmark.time(SortingSuite::MergeSort).split.first
    assert_equal 'MergeSort',result

    result=benchmark.time(SortingSuite::InsertionSort).split.first
    assert_equal 'InsertionSort',result
  end

  def test_time_returns_sorting_time
    benchmark=SortingSuite::Benchmark.new
    puts returned = benchmark.time(SortingSuite::MergeSort)

    #returned string format is correct
    assert_equal "MergeSort took  seconds",returned.gsub(/[0-9]./,'')
    assert_kind_of Float, returned.scan(/[0-9]./).join.to_f

    #time close to 0 when empty
    assert_in_delta 0, returned.scan(/[0-9]./).join.to_f, 0.01

    #longer time for longer arrays with MergeSort
    puts returned_short = benchmark.time(SortingSuite::MergeSort,[9,5,2,1,7])
    puts returned_long = benchmark.time(SortingSuite::MergeSort,([9,5,2,1,7]*5))
    assert returned_short.scan(/[0-9]./).join.to_f < returned_long.scan(/[0-9]./).join.to_f

    #longer time for longer arrays with BubbleSort
    puts returned_short = benchmark.time(SortingSuite::BubbleSort,[9,5,2,1,7])
    puts returned_long = benchmark.time(SortingSuite::BubbleSort,([9,5,2,1,7]*5))
    assert returned_short.scan(/[0-9]./).join.to_f < returned_long.scan(/[0-9]./).join.to_f

  end


  def test_run_all_uses_given_or_existing_or_empty_array
    benchmark=SortingSuite::Benchmark.new

    #none given, none existing
    benchmark.run_all()
    assert_equal [],benchmark.array

    #array given, none existing
    benchmark.run_all([3,1,4,2])
    assert_equal [3,1,4,2],benchmark.array

    #array given, array existing
    benchmark.run_all()
    assert_equal [3,1,4,2],benchmark.array

    #array given, none existing
    benchmark=SortingSuite::Benchmark.new
    benchmark.run_all(%w(o e d k a c l d i))
    assert_equal %w(o e d k a c l d i),benchmark.array
  end

  def test_run_all_calls_every_sorter_and_returns_hash_sorter_time

    benchmark=SortingSuite::Benchmark.new
    array=%w(o e d k a c l d i)*25
    all_runs = {
      BubbleSort:benchmark.time(SortingSuite::BubbleSort,array).scan(/[0-9]./).join.to_f,
      InsertionSort:benchmark.time(SortingSuite::InsertionSort,array).scan(/[0-9]./).join.to_f,
      MergeSort:benchmark.time(SortingSuite::MergeSort,array).scan(/[0-9]./).join.to_f,
      SelectionSort:benchmark.time(SortingSuite::SelectionSort,array).scan(/[0-9]./).join.to_f

    }

    #return hash of times of completion per sorting_suite
    assert_kind_of Symbol,benchmark.run_all(array).keys.sample
    assert_kind_of Float,benchmark.run_all(array).values.sample
    #runs every test
    assert_equal all_runs.keys,benchmark.run_all(array).keys
    #completion time difference is less than 3 seconds
    assert_in_delta all_runs.values.reduce(:+),benchmark.run_all(array).values.reduce(:+),3000

  end

  def test_pick_fastest_returns_faster_sorter_data
    benchmark=SortingSuite::Benchmark.new
    hash={a:5,b:0,c:3,d:1}
    assert_equal :b,benchmark.pick_fastest(hash)
  end

  def test_pick_slowest_returns_slower_sorter_data
    benchmark=SortingSuite::Benchmark.new
    hash={a:5,b:0,c:3,d:1}
    assert_equal :a,benchmark.pick_slowest(hash)
  end

  def test_to_s_has_correct_formatting
    skip
  end
end
