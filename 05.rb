
count = 0
File.open("05.txt", "r") do |f|
  f.each_line do |word|
    word.strip!
    print word, ": "
    vowelCount = 0
    foundDouble = false
    foundBad = false

    i = 0
    len = word.length
    while i < word.length - 1
      pair = word[i..i+1]
      if pair == 'ab' or pair == 'cd' or pair == 'pq' or pair == 'xy'
        foundBad = true
        break
      end

      if vowelCount < 3 and "aeiou".include? word[i]
        vowelCount += 1
      end

      if not foundDouble and word[i] == word[i+1]
        foundDouble = true
      end

      i += 1
    end

    # last char, no +1 but still check fro vowel
    if vowelCount < 3 and "aeiou".include? word[i]
      vowelCount += 1
    end

    if vowelCount >= 3 and foundDouble and not foundBad
      count += 1
      puts "NICE"
    else
      puts "NAUGHTY"
    end

  end
end

print "Nice Count: ", count
