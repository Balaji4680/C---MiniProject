<p align="center">
  <img src="images/banner.png" alt="Phone Book App banner" width="100%">
</p>

A menu based phone book written in **C** using a **singly linked list**, **file handling** and a **Makefile**.
Your contacts are saved in a file, so they are still there when you open the program again.

![Language](https://img.shields.io/badge/language-C-blue)
![Build](https://img.shields.io/badge/build-make-green)
![Data Structure](https://img.shields.io/badge/data%20structure-linked%20list-orange)

## ⚡ Quick Start
```bash
make            # compile
./phonebook     # run
```

<p align="center">
  <img src="images/terminal_demo.png" alt="Example run in the terminal" width="85%">
</p>

## ✨ Features
- ➕ Add a contact with up to **5 phone numbers**, email and address
- 📋 Show all contacts
- 🔍 Find a contact by name
- ✏️ Edit any detail of a contact
- 🗑️ Delete a contact
- 💾 Save to a file and **load automatically** next time
- 🚫 Two contacts cannot have the same name

## 🕹️ Menu
```
c/C : Create a new contact
p/P : Print all contacts
d/D : Delete a contact
f/F : Find a contact
e/E : Edit a contact
s/S : Save contacts to file
q/Q : Quit
```
> ⚠️ Press `s` to save before you quit, or new contacts will be lost.

## 🔄 Program Flow
<p align="center">
  <img src="images/flowchart.png" alt="Flow chart of the program" width="90%">
</p>

The program loads the saved contacts, then shows the menu again and again until you press `q`.

## 🧠 How It Works
Every contact is stored in one structure, and the structures are joined together like a chain. This is a **singly linked list**.

<p align="center">
  <img src="images/linked_list.png" alt="Linked list diagram" width="95%">
</p>

```c
typedef struct contact
{
    char name[MAX_NAME];
    char phone[MAX_NUMBERS][MAX_PHONE];
    int  phone_count;
    char email[MAX_EMAIL];
    char address[MAX_ADDRESS];
    struct contact *next;     // points to the next contact
} CONTACT;
```

### 💾 Saving and Loading
<p align="center">
  <img src="images/save_load.png" alt="Saving and loading diagram" width="90%">
</p>

- **Saving:** pressing `s` writes every contact to `phonebook.dat`.
- **Loading:** when the program starts, it reads `phonebook.dat` and builds the list again. On the first run there is no file, so the phone book starts empty.

The saved file is plain text, so you can open it and read it:
```
=============== CONTACT 1 ===============
Name    :Ravi
Count   :2
Phone number[1] :9876543210
Phone number[2] :9123456780
Email    :ravi@gmail.com
Address  :Not Available
```

## 📁 Project Files
| File | What it does |
|------|--------------|
| `main.c` | Shows the menu and calls the functions |
| `create.c` | `create_contact()` adds a contact |
| `display.c` | `display_contact()` shows all contacts |
| `search.c` | `search_contact()` finds a contact |
| `edit.c` | `edit_contact()` changes a contact |
| `delete.c` | `delete_contact()` removes a contact |
| `save.c` | `save_contacts()` writes contacts to the file |
| `file1.c` | `load_contacts()` reads contacts from the file |
| `free.c` | `free_contacts()` frees memory when the program ends |
| `phonebook.h` | Structure, limits and function names |
| `Makefile` | Compiles the project |
| `images/` | Diagrams used in this readme |

## 🔧 Build Commands
| Command | What it does |
|---------|--------------|
| `make` | Compile the project |
| `make run` | Compile and run |
| `make clean` | Delete compiled files |

- **Add a file:** copy the new `.c` file into the folder and run `make`.
- **Remove a file:** delete it, then run `make clean` and `make`.
- **Needs:** `gcc` and `make` (`sudo apt install gcc make`).

## 💡 Design Highlights
- **Linked list:** no fixed contact limit, and deleting a contact only changes pointers.
- **`CONTACT **head`** is used in create, delete, load and free because they can change the first node.
- **Text file:** easy to read and debug.
- **One function per file:** easy to understand and change.
- **Memory:** every `malloc` has a matching `free`.

## ⚠️ Known Limitations
- A phone number can have up to 10 characters.
- Names are case sensitive (`ravi` and `Ravi` are different).
- Search is by exact name only.
- Very long input can overflow a field. Using `fgets` or width limits like `%49[^\n]` would fix this.

## 🚀 Future Improvements
- Auto save on quit
- Search by phone number or part of a name
- Sort contacts by name
- Check phone number and email format

## 👤 Author
**Name:** `<your name>`  
**ID:** `<your ID>`
