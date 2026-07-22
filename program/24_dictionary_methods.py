d = {"name": "Bob", "age": 22, "city": "Rajkot"}
print("Original dictionary:", d)
print("Length:", len(d))
print("Get 'age':", d.get("age"))

d.update({"gender": "Male"})
print("After update:", d)

d.pop("city")
print("After pop('city'):", d)

d["country"] = "India"
print("After adding key 'country':", d)

print("Keys:", d.keys())
print("Values:", d.values())
print("Items:", d.items())

d2 = d.copy()
print("Copied dictionary:", d2)

d.clear()
print("After clear:", d)
