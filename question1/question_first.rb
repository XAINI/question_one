def random_str( len )
  chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  random_str = ""
  1.upto(len) { |i| random_str << chars[rand(chars.size-1)] }
  return random_str
end

p random_str(32)