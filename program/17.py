lst = [10, 20, 30, 40]
print("Original List:", lst)
print("Length:", len(lst))
print("Count of 20:", lst.count(20))
print("Index of 30:", lst.index(30))

lst.append(50)
print("After append(50):", lst)

lst.insert(2, 25)
print("After insert at index 2:", lst)

lst.extend([60, 70])
print("After extend:", lst)

lst.remove(25)
print("After remove 25:", lst)

lst.pop()
print("After pop():", lst)

lst.reverse()
print("After reverse():", lst)

lst.sort()
print("After sort():", lst)

copy_list = lst.copy()
print("Copied List:", copy_list)

lst.clear()
print("After clear():", lst)
