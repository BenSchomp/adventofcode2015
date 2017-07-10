file = open('08.ex.txt', 'r')

lines = []
total = 0
count = 0

for line in file:
  lines.append( line.rstrip() )
file.close()

for line in lines:
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

print " Part 1 Answer: %d - %d = %d" % (total, count, total-count )
print

count = 0
for line in lines:
  cur = len(line)
  cur += 2

  cur += line.count('\\')
  cur += line.count('"')

  count += cur
  print line, cur
  
print " Part 2 Answer: %d - %d = %d" % ( count, total, count-total )

