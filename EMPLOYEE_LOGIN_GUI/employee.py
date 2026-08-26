import tkinter as tk
from tkinter import messagebox

root = tk.Tk()
root.title("EMPLOYEE")
root.geometry("700x500")

title_lable= tk.Label(root, text="Employee Detail Form" , font="ar 15 bold" ,bg="lightblue")
title_lable.grid(row=0,column=0,columnspan=2,padx=10,pady=10)


name_label = tk.Label(root, text="Name")
name_label.grid(row=1, column=0, padx=10, pady=10)
name_entry = tk.Entry(root)
name_entry.grid(row=1, column=1, padx=10, pady=10)

email_label = tk.Label(root, text="Email")
email_label.grid(row=2, column=0, padx=10, pady=10)
email_entry = tk.Entry(root)
email_entry.grid(row=2, column=1, padx=10, pady=10)

phone_label = tk.Label(root, text="Phone")
phone_label.grid(row=3, column=0, padx=10, pady=10)
phone_entry = tk.Entry(root)
phone_entry.grid(row=3, column=1, padx=10, pady=10)

address_label = tk.Label(root, text="Address")
address_label.grid(row=4, column=0, padx=10, pady=10)
address_entry = tk.Entry(root)
address_entry.grid(row=4, column=1, padx=10, pady=10)

age_label = tk.Label(root, text="Age")
age_label.grid(row=5, column=0, padx=10, pady=10)
age_entry = tk.Entry(root)
age_entry.grid(row=5, column=1, padx=10, pady=10)

gender_label = tk.Label(root, text="Gender")
gender_label.grid(row=6, column=0, padx=10, pady=10)
gender_entry = tk.Entry(root)
gender_entry.grid(row=6, column=1, padx=10, pady=10)

department_label = tk.Label(root, text="Department")
department_label.grid(row=7, column=0, padx=10, pady=10)
department_entry = tk.Entry(root)
department_entry.grid(row=7, column=1, padx=10, pady=10)

designation_label = tk.Label(root, text="Designation")
designation_label.grid(row=8, column=0, padx=10, pady=10)
designation_entry = tk.Entry(root)
designation_entry.grid(row=8, column=1, padx=10, pady=10)

salary_label = tk.Label(root, text="Salary")
salary_label.grid(row=9, column=0, padx=10, pady=10)
salary_entry = tk.Entry(root)
salary_entry.grid(row=9, column=1, padx=10, pady=10)

joining_date_label = tk.Label(root, text="Joining Date")
joining_date_label.grid(row=10, column=0, padx=10, pady=10)
joining_date_entry = tk.Entry(root)
joining_date_entry.grid(row=10, column=1, padx=10, pady=10)


def submit_form():
    name =name_entry.get()
    email =email_entry.get()
    phone =phone_entry.get()
    address =address_entry.get()
    age = age_entry.get()
    gender =gender_entry.get()
    department= department_entry.get()
    designation =designation_entry.get()
    salary =salary_entry.get()
    joining_date =joining_date_entry.get()


    if not name or not age or not email:
        messagebox.showerror(title="Error", message="All fields are required")
    else:
        messagebox.showinfo(title="Form Submitted",
         message=f"Name:{name}\nEmail:{email}\nPhone:{phone}\naddress:{address}\nage:{age}\ngender:{gender}\ndepartment:{department}\ndesignation:{designation}\nsalary:{salary}\njoining date:{joining_date}")

submit_button =tk.Button(root, text="Submit", command=submit_form ,bg="#FF4521", fg="white")
submit_button.grid(row=11,column=0,columnspan=2,padx=10,pady=10)

root.mainloop()