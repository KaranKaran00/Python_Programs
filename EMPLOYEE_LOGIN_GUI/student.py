import tkinter as tk
from tkinter import messagebox

root = tk.Tk()
root.title("Student CRUD")
root.geometry("450x450")

students = {}

tk.Label(root, text="Student ID").pack()
id_entry = tk.Entry(root)
id_entry.pack()

tk.Label(root, text="Student Name").pack()
name_entry = tk.Entry(root)
name_entry.pack()

tk.Label(root, text="City").pack()
city_entry = tk.Entry(root)
city_entry.pack()


def insert_data():
    sid = id_entry.get()

    if sid == "" or name_entry.get() == "" or city_entry.get() == "":
        messagebox.showerror("Error", "Fill all fields")
    elif sid in students:
        messagebox.showerror("Error", "ID already exists")
    else:
        students[sid] = (name_entry.get(), city_entry.get())
        messagebox.showinfo("Success", "Record Inserted")


def display_data():
    result.delete("1.0", tk.END)

    for sid, data in students.items():
        result.insert(tk.END, f"{sid}  {data[0]}  {data[1]}\n")


def update_data():
    sid = id_entry.get()

    if sid in students:
        students[sid] = (name_entry.get(), city_entry.get())
        messagebox.showinfo("Success", "Record Updated")
    else:
        messagebox.showerror("Error", "Student Not Found")


def delete_data():
    sid = id_entry.get()

    if sid in students:
        del students[sid]
        messagebox.showinfo("Success", "Record Deleted")
    else:
        messagebox.showerror("Error", "Student Not Found")


tk.Button(root, text="Insert", width=10, command=insert_data).pack(pady=3)
tk.Button(root, text="Display", width=10, command=display_data).pack(pady=3)
tk.Button(root, text="Update", width=10, command=update_data).pack(pady=3)
tk.Button(root, text="Delete", width=10, command=delete_data).pack(pady=3)

tk.Label(root, text="Student Records").pack(pady=5)

result = tk.Text(root, height=8, width=45)
result.pack()

root.mainloop()