import tkinter as tk
from tkinter import messagebox
import mysql.connector

root = tk.Tk()
root.title("Student CRUD")
root.geometry("400x400")

def connect():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="examdb"
    )

tk.Label(root, text="Student ID").pack()
id_entry = tk.Entry(root)
id_entry.pack()

tk.Label(root, text="Student Name").pack()
name_entry = tk.Entry(root)
name_entry.pack()

tk.Label(root, text="City").pack()
city_entry = tk.Entry(root)
city_entry.pack()


# 1. INSERT
def insert_data():
    con = connect()
    cur = con.cursor()

    cur.execute(
        "INSERT INTO student VALUES (%s,%s,%s)",
        (id_entry.get(), name_entry.get(), city_entry.get())
    )

    con.commit()
    con.close()

    messagebox.showinfo("Success", "Record Inserted")


# 2. DISPLAY
def display_data():
    con = connect()
    cur = con.cursor()

    cur.execute("SELECT * FROM student")
    rows = cur.fetchall()

    result.delete("1.0", tk.END)

    for row in rows:
        result.insert(tk.END, str(row) + "\n")

    con.close()


# 3. UPDATE
def update_data():
    con = connect()
    cur = con.cursor()

    cur.execute(
        "UPDATE student SET name=%s, city=%s WHERE id=%s",
        (name_entry.get(), city_entry.get(), id_entry.get())
    )

    con.commit()
    con.close()

    messagebox.showinfo("Success", "Record Updated")


# 4. DELETE
def delete_data():
    con = connect()
    cur = con.cursor()

    cur.execute(
        "DELETE FROM student WHERE id=%s",
        (id_entry.get(),)
    )

    con.commit()
    con.close()

    messagebox.showinfo("Success", "Record Deleted")


tk.Button(root, text="Insert", command=insert_data).pack()
tk.Button(root, text="Display", command=display_data).pack()
tk.Button(root, text="Update", command=update_data).pack()
tk.Button(root, text="Delete", command=delete_data).pack()

result = tk.Text(root, height=8, width=40)
result.pack()

root.mainloop()