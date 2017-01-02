$map = {}

def markSeen( x, y )
  $map[x.to_s + ',' + y.to_s] = 1
end

x = 0
y = 0
markSeen( x, y )

File.open("03.txt", "r") do |f|
  f.each_line do |line|

  line.chars{ |dir|
    if dir == '>'
      x += 1
    elsif dir == '<'
      x -= 1
    elsif dir == '^'
      y -= 1
    elsif dir == 'v'
      y += 1
    end
    markSeen( x, y )
  }
  end
end

print "Num Houses: ", $map.length

