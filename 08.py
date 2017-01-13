file = open('08.in.txt', 'r')

total = 0
count = 0
for line in file:
  line = line.rstrip()
  ll = len(line)
  total += ll
  line = line[1:ll-1]
  print line

  i = 0
  while i < len(line):
    c = line[i]
    if c == '\\':
      n = line[i+1]
      if n == '\\' or n == '"':
        i += 1
      elif n == 'x':
        i += 3

    count += 1
    i += 1


print "Answer: %d - %d = %d" % (total, count, total-count )

