size = 1000
part = 2
lights = Array.new(size){Array.new(size) {0}}

def display( a )
  a.each do |row|
    row.each do |light|
      if light == 0
        print '.'
      else
        print 'X'
      end
    end
    puts
  end
end

count = 0
File.open("06.txt", "r") do |f|
  f.each_line do |line|
    parts = line.split
    
    value = 0
    if parts[0] == 'turn'
      topleft = parts[2].split(',')
      botright = parts[4].split(',')
      if parts[1] == 'on'
        value = 1
      end
    elsif parts[0] == 'toggle'
      topleft = parts[1].split(',')
      botright = parts[3].split(',')
      value = 2 
    end

    (topleft[0].to_i .. botright[0].to_i).each do |y|
      (topleft[1].to_i .. botright[1].to_i).each do |x|

        if part == 1
          prev = lights[x][y]
          if value == 2 # toggle
            lights[x][y] ^= 1
          else # on (1) or off (0)
            lights[x][y] = value
          end
          post = lights[x][y]

          if prev > post
            count -= 1
          elsif prev < post
            count += 1
          end

        else # part == 2
          if value == 0 # off (-1)
            if lights[x][y] > 0
              lights[x][y] -= 1
              count -= 1
            end
          else # on (+1) or toggle (+2)
            lights[x][y] += value
            count += value
          end
        end

      end
    end

  end
end

#display(lights)
print "Lit: #{count}"

