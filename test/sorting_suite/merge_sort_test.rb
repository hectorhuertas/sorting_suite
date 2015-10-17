require 'minitest'
require 'sorting_suite/merge_sort'

class MergeSortTest < Minitest::Test
  def test_it_exists
    sorter=SortingSuite::MergeSort.new
    assert sorter
  end

  def test_it_sorts_empty
    sorter=SortingSuite::MergeSort.new
    assert_equal [],sorter.sort([])
  end

  def test_it_sorts_single
    sorter=SortingSuite::MergeSort.new
    assert_equal [3],sorter.sort([3])
  end

  def test_it_sorts_even_of_fixnum
    sorter=SortingSuite::MergeSort.new
    assert_equal [1,2,6,8],sorter.sort([6,2,8,1])
  end

  def test_it_sorts_even_of_string
    sorter=SortingSuite::MergeSort.new
    assert_equal %w(c d e i o q),sorter.sort(%w(e c o d q i))
  end

  def test_it_sorts_odd_of_fixnum
    sorter=SortingSuite::MergeSort.new
    assert_equal [1,2,6,8,9],sorter.sort([6,2,9,8,1])
  end

  def test_it_sorts_odd_of_string
    sorter=SortingSuite::MergeSort.new
    assert_equal %w(c d e i o q x),sorter.sort(%w(e x c o d q i))
  end
end
