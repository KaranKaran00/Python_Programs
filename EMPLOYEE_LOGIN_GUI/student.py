from tkinter import *

def submit():
    name = fname.get() + " " + lname.get()
    gender = "Male" if g.get() == 1 else "Female"
    subjects = [lb.get(i) for i in lb.curselection()]
    out.config(text=f"Name: {name}\nGender: {gender}\nSubjects: {subjects}")

root = Tk()
root.title("Student Form")
root.geometry("300x400")

Label(root, text="First Name").pack()
fname = Entry(root)
fname.pack()

Label(root, text="Last Name").pack()
lname = Entry(root)
lname.pack()

g = IntVar(value=1)
Radiobutton(root, text="Male", variable=g, value=1).pack()
Radiobutton(root, text="Female", variable=g, value=2).pack()

Label(root, text="Select Subjects").pack()
lb = Listbox(root, selectmode=MULTIPLE, height=3)
lb.pack()

for s in ["Python", "J2EE", "CS"]:
    lb.insert(END, s)

Button(root, text="Submit", command=submit, bg="green", fg="white").pack(pady=10)

out = Label(root, text="")
out.pack()

root.mainloop()
