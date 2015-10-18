module SortingSuite
class SelectionSort
  def sort(array_in)
    (array_in.size()-1).times do |pos|
      min=array_in[pos]
      # array_in.slice(pos..-1)
      array_in.slice((pos+1)..-1).each do |value|
        min
        value
        min=value if value<min
      end
      min
      array_in[pos]
      if min<array_in[pos]
        # array_in.index(min)
        aux=min
        # array_in.index(min)=array_in[pos]
        array_in[array_in.index(min)]=array_in[pos]
        array_in[pos]=min
      end
    end



    array_in

  end
end
end

sorter=SortingSuite::SelectionSort.new
sorter.sort([2,6,3,1])
