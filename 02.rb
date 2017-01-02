totalArea = 0
totalRibbon = 0

File.open("02.txt", "r") do |f|
  f.each_line do |line|
    sides = []
    line.split('x').each { |dim|
      sides << dim.to_i
    }
    # area: 2*l*w + 2*w*h + 2*h*l
    areas = []
    areas << sides[0] * sides[1]
    areas << sides[0] * sides[2]
    areas << sides[1] * sides[2]
    
    area = areas.sort[0]
    areas.each{ |a| area += a * 2 }

    totalArea += area

    # ribbon: shortest perimiter + cubic volume
    sides.sort!
    totalRibbon += (sides[0] + sides[1]) * 2
    totalRibbon += (sides[0] * sides[1] * sides[2])
  end
end

print "TotalArea:   ", totalArea
print "\nTotalRibbon: ", totalRibbon

