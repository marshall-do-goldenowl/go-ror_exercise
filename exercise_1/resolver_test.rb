# write code here...
def check_pair_equal_sum(result, array)
  output = []
  sanitize_array = array.uniq
  sanitize_array.each do |e|
    output << [result - e, e] if sanitize_array.include?(result - e)
  end
  output.select { |x| x[0] < x[1] }
end

def test_check_pair_equal_sum
  puts assert(check_pair_equal_sum(10, [3, 4, 5, 6, 7]) == [[4, 6], [3, 7]])
  puts assert(check_pair_equal_sum(8, [3, 4, 5, 4, 4]) == [[3, 5]])
end
