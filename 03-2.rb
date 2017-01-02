$map = {}

def markSeen( x, y )
  $map[x.to_s + ',' + y.to_s] = 1
end

x = [0, 0]
y = [0, 0]

2.times { |i| markSeen( x[i], y[i] ) }
cur = 0

File.open("03.txt", "r") do |f|
  f.each_line do |line|

  line.chars{ |dir|
    if dir == '>'
      x[cur] += 1
    elsif dir == '<'
      x[cur] -= 1
    elsif dir == '^'
      y[cur] -= 1
    elsif dir == 'v'
      y[cur] += 1
    end
    markSeen( x[cur], y[cur] )

    cur = 1 >> cur # flip between 0 & 1
  }
  end
end

print "Num Houses: ", $map.length

