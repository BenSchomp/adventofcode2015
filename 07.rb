map = {}
cmds = {}
intmax = 65535

class String
  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end
end

File.open("07.txt", "r") do |f|
  i = 0
  f.each_line do |line|
    (lhs_, rhs) = line.split('->')
    lhs_.strip!
    rhs.strip!
    lhs = lhs_.split()
    cmds[i] = [lhs, rhs]
    i += 1
  end
end

i = 0
count = 0
while cmds.length > 0 do
  value = nil
  line = cmds[i]
  print "#{i}. 0: #{line[0]}, 1: #{line[1]}\n"
  lhs = line[0]
  rhs = line[1]

  #print "#{i}: #{line}, #{lhs}, #{rhs} // #{rhs} = #{lhs.join(' ')}\n"

  if lhs.length == 1
    a = lhs[0]
    if a.is_i?
      value = a.to_i
    elsif map.key?( a )
      value = map[a]
    end

  elsif lhs.length == 2
    cmd = lhs[0]
    a   = lhs[1]
    if map.key?( a ) and cmd == "NOT"
      value = ~ map[a]
    end
    
  elsif lhs.length == 3
    a   = lhs[0]
    cmd = lhs[1]
    b   = lhs[2]
    if map.key?( a )
      if cmd == "LSHIFT"
        value = map[a] << b.to_i
      elsif cmd == "RSHIFT"
        value = map[a] >> b.to_i
      end
      if map.key?( b )
        if cmd == "AND"
          value = map[a] & map[b]
        elsif cmd == "OR"
          value = map[a] | map[b]
        end
      end
    end
  end

  if value.nil?
    i += 1
    if i >= cmds.length
      i = 0
      #print "too far\n"
      #break
    end
  else
    if value < 0
      map[rhs] = value + intmax + 1
    elsif value > intmax
      map[rhs] = value - intmax - 1
    else
      map[rhs] = value
    end
    cmds.delete( i )
    i = 0

    count += 1
  end
end

print map, "\n"
#print cmds, "\n"

# *** THIS NEEDS TO BE RECURSIVE I THINK ***

