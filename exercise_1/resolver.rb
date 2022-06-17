def check_pair_equal_sum(result, array)
  output = []
  sanitize_array = array.uniq
  sanitize_array.each do |e|
    output << [result - e, e] if sanitize_array.include?(result - e)
  end
  output.select { |x| x[0] < x[1] }
end
