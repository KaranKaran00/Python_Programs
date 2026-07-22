s = {10, 20, 30}
print("Original set:", s)

s.add(40)
print("After add(40):", s)

s.update([50, 60])
print("After update([50, 60]):", s)

s2 = s.copy()
print("Copied set:", s2)

s.pop()
print("After pop():", s)

s.discard(20)
print("After discard(20):", s)

if 30 in s:
    s.remove(30)
print("After remove(30):", s)

s.clear()
print("After clear():", s)

a = {1, 2, 3}
b = {3, 4, 5}
print("Set A:", a)
print("Set B:", b)
print("Union:", a.union(b))
print("Intersection:", a.intersection(b))
print("Difference:", a.difference(b))
