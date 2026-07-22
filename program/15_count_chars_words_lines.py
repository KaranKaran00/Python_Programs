with open("test.txt", "r") as file:
    text = file.read()

chars = len(text)
words = len(text.split())
lines = len(text.splitlines())

print("Characters:", chars)
print("Words:", words)
print("Lines:", lines)
