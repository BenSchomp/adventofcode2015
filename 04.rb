require 'digest/md5'

key = 'iwrupvqb'
count = 0
while true
  h = Digest::MD5.hexdigest(key + count.to_s)
  if h[0..5] == "000000"
    break
  end
  count += 1
end

print count
