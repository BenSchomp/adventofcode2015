
count = 0
File.open("05.txt", "r") do |f|
  f.each_line do |word|
    word.strip!
    print word, ": "
    foundPair = false
    foundTrip = false

    i = 0
    len = word.length
    while i < word.length - 2
      if not foundPair and word[i+2..-1].include? word[i,2]
        print "(pair:", word[i,2], ") "
        foundPair = true
      end

      if not foundTrip and word[i] == word[i+2]
        print "(trip:", word[i,3], ") "
        foundTrip = true
      end

      i += 1
    end

    if foundPair and foundTrip
      count += 1
      puts "NICE"
    else
      puts "NAUGHTY"
    end

  end
end

print "Nice Count: ", count
