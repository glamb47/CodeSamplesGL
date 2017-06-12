full = open('my_full.txt', 'r+')
lines = full.read()
partial = lines[:20]
final = open('my_partial.txt', 'w')
final.write(partial)
final.close()
