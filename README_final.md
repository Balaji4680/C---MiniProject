<a id="top"></a>

<p align="center">
  <img width="100%" alt="Phone Book App banner" src="https://github.com/user-attachments/assets/e0ea1a7c-4e5d-44c3-a385-bad53c918446" />
</p>

<p align="center">
  <b>
    <a href="#toc">Contents</a> •
    <a href="#about">About</a> •
    <a href="#quick-start">Quick Start</a> •
    <a href="#features">Features</a> •
    <a href="#menu">Menu</a> •
    <a href="#how-to-use">How to Use</a> •
    <a href="#flow">Flow</a> •
    <a href="#how-it-works">How It Works</a> •
    <a href="#files">Files</a> •
    <a href="#build">Build</a> •
    <a href="#author">Author</a>
  </b>
</p>

<h3 align="center">A simple, lightweight contact manager for the terminal, built from scratch in C.</h3>

**Phone Book App** lets you create, find, edit and delete contacts right from the command line. Each contact can hold several phone numbers, an email and an address.

Contacts are kept in a **singly linked list** while the program runs, and are saved to a text file with **file handling**, so your data is still there the next time you start it. The code is split into small files, one for each function, and is built with a **Makefile**.

<p align="center">
  <img src="https://img.shields.io/badge/Language-C-00599C?style=for-the-badge&logo=c&logoColor=white" alt="Language C">
  <img src="https://img.shields.io/badge/Compiler-GCC-A42E2B?style=for-the-badge&logo=gnu&logoColor=white" alt="Compiler GCC">
  <img src="https://img.shields.io/badge/Build-Makefile-2E7D32?style=for-the-badge" alt="Build Makefile">
  <br>
  <img src="https://img.shields.io/badge/Data%20Structure-Linked%20List-F57C00?style=for-the-badge" alt="Data Structure Linked List">
  <img src="https://img.shields.io/badge/Storage-File%20Handling-00897B?style=for-the-badge" alt="Storage File Handling">
  <img src="https://img.shields.io/badge/Platform-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Platform Linux">
</p>

<a id="toc"></a>
## 📑 Table of Contents
1. [About the Project](#about)
   - [Why this project?](#why)
   - [At a Glance](#glance)
   - [Concepts Used](#concepts)
2. [Quick Start](#quick-start)
3. [Features](#features)
4. [Menu](#menu)
5. [How to Use](#how-to-use)
6. [Program Flow](#flow)
7. [How It Works](#how-it-works)
   - [Saving and Loading](#save-load)
8. [Project Files](#files)
9. [Build Commands](#build)
10. [Design Highlights](#design)
11. [Known Limitations](#limitations)
12. [Future Improvements](#future)
13. [Author](#author)

<a id="about"></a>
## 📖 About the Project
This is a console **Phone Book App** that works like the contact list on a phone, but runs in the terminal. You can add people with several phone numbers, an email and an address, and then find, edit or delete them.

When you save, everything is written to a file called `phonebook.dat`. The next time you start the program, the contacts are loaded back, so nothing is lost.

<a id="why"></a>
### 🎯 Why this project?
- Shows how a **linked list** works in a real program, not just on paper
- Practises **pointers and dynamic memory** with `malloc` and `free`
- Shows how data can **stay saved** between runs using **file handling**
- Teaches how to **split a program into several files** and build it with `make`

<a id="glance"></a>
### 📊 At a Glance
| | |
|---|---|
| 💻 **Language** | C |
| 🔗 **Data structure** | Singly linked list |
| 💾 **Storage** | Plain text file (`phonebook.dat`) |
| 📞 **Numbers per contact** | Up to 5 |
| 🧩 **Structure** | 9 source files and 1 header file |
| 🛠️ **Build tool** | `make` with `gcc` |
| 🐧 **Platform** | Linux (also works on WSL and MinGW) |

<a id="concepts"></a>
### 🧰 Concepts Used
| Concept | Where you can see it |
|---------|----------------------|
| Structures and `typedef` | `phonebook.h` |
| Linked list: add, search, delete | `create.c`, `search.c`, `delete.c` |
| Pointer to pointer (`CONTACT **head`) | `create.c`, `delete.c`, `file1.c`, `free.c` |
| Dynamic memory (`malloc`, `free`) | `create.c`, `delete.c`, `free.c` |
| File handling (`fprintf`, `fscanf`) | `save.c`, `file1.c` |
| Menu with `switch` | `main.c` |
| Makefile | `Makefile` |

<a id="quick-start"></a>
## ⚡ Quick Start
```bash
git clone https://github.com/<your-username>/<your-repo-name>.git
cd <your-repo-name>
make            # compile
./phonebook     # run
```
You need `gcc` and `make`. On Ubuntu or Debian, install them with `sudo apt install gcc make`.

<p align="center">
  <img width="1520" height="668" alt="terminal_demo" src="https://github.com/user-attachments/assets/14bc613c-eb81-4031-b1b0-df19d63d18f4" />
</p>

<a id="features"></a>
## ✨ Features
- ➕ Add a contact with up to **5 phone numbers**, email and address
- 📋 Show all contacts
- 🔍 Find a contact by name
- ✏️ Edit any detail of a contact
- 🗑️ Delete a contact
- 💾 Save to a file and **load automatically** next time
- 🚫 Two contacts cannot have the same name

<a id="menu"></a>
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

<a id="how-to-use"></a>
## 📘 How to Use
Type one letter from the menu and press Enter.

| Task | What to do |
|------|------------|
| **Add a contact** | Press `c`, type the name and the first phone number. Answer `y` to add more numbers (up to 5), then answer `y` or `n` for email and address. Skipped fields are stored as `Not Available` |
| **Show all contacts** | Press `p` |
| **Find a contact** | Press `f` and type the exact name |
| **Edit a contact** | Press `e`, type the name, then answer `y` or `n` for the name, phone numbers, email and address |
| **Delete a contact** | Press `d` and type the exact name |
| **Save** | Press `s`. This writes all contacts to `phonebook.dat` |
| **Quit** | Press `q`. This frees the memory and exits |

Example of what **Print** (`p`) shows:
```
name:Ravi
phone number[1] :9876543210
phone number[2] :9123456780
email:ravi@gmail.com
address:Not Available
```

<a id="flow"></a>
## 🔄 Program Flow
<p align="center">
  <img width="1640" height="1240" alt="flowchart" src="https://github.com/user-attachments/assets/a3f5ae36-bce4-4e4c-bd14-6e0e1d76d68f" />
</p>

The program loads the saved contacts, then shows the menu again and again until you press `q`.

<a id="how-it-works"></a>
## 🧠 How It Works
Every contact is stored in one structure, and the structures are joined together like a chain. This is a **singly linked list**.

<p align="center">
  <img width="1740" height="524" alt="linked_list" src="https://github.com/user-attachments/assets/da56179e-0fd6-4e86-b073-5f0aad40f7bd" />
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

<a id="save-load"></a>
### 💾 Saving and Loading
<p align="center">
  <img width="1520" height="480" alt="save_load" src="https://github.com/user-attachments/assets/15477d20-f327-4b52-b871-a82a584e4777" />
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
If you edit this file by hand, keep the labels (`Name`, `Count`, `Phone number`, `Email`, `Address`) unchanged, or loading will stop at that contact.

<a id="files"></a>
## 📁 Project Files
```
phonebook/
├── main.c         # menu and main loop
├── create.c       # create_contact()
├── display.c      # display_contact()
├── search.c       # search_contact()
├── edit.c         # edit_contact()
├── delete.c       # delete_contact()
├── save.c         # save_contacts()
├── file1.c        # load_contacts()
├── free.c         # free_contacts()
├── phonebook.h    # structure, limits and function names
├── Makefile       # compiles the project
└── README.md
```

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

<a id="build"></a>
## 🔧 Build Commands
| Command | What it does |
|---------|--------------|
| `make` | Compile the project |
| `make run` | Compile and run |
| `make clean` | Delete compiled files |

- **Add a file:** copy the new `.c` file into the folder and run `make`.
- **Remove a file:** delete it, then run `make clean` and `make`.
- **Needs:** `gcc` and `make` (`sudo apt install gcc make`).

<a id="design"></a>
## 💡 Design Highlights
- **Linked list:** no fixed contact limit, and deleting a contact only changes pointers.
- **`CONTACT **head`** is used in create, delete, load and free because they can change the first node.
- **Text file:** easy to read and debug.
- **One function per file:** easy to understand and change.
- **Memory:** a contact's memory is freed when it is deleted, and the whole list is freed when you quit.

<a id="limitations"></a>
## ⚠️ Known Limitations
- A phone number can have up to 10 characters.
- Names are case sensitive (`ravi` and `Ravi` are different).
- Search is by exact name only.
- Very long input can overflow a field. Using `fgets` or width limits like `%49[^\n]` would fix this.

<a id="future"></a>
## 🚀 Future Improvements
- Auto save on quit
- Search by phone number or part of a name
- Sort contacts by name
- Check phone number and email format

<a id="author"></a>
## 👤 Author
**Name:** `Balaji Pidikiti`  
**ID:** `V25HE11B5`

<p align="center">
  <a href="#top">⬆ Back to top</a>
</p>
