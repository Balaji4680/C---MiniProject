==============================================================
                 PHONE BOOK APP  (C Language)
==============================================================
Singly Linked List | File Handling | Makefile


QUICK START
-----------
      make              (compile)
      ./phonebook       (run)


ABOUT
-----
A menu based phone book written in C. Contacts are saved in a
file, so they are still there when you open the program again.


FEATURES
--------
  - Add a contact with up to 5 phone numbers, email and address
  - Show all contacts
  - Find a contact by name
  - Edit any detail of a contact
  - Delete a contact
  - Save to a file and load automatically next time
  - Two contacts cannot have the same name


MENU
----
  c/C : Create a new contact
  p/P : Print all contacts
  d/D : Delete a contact
  f/F : Find a contact
  e/E : Edit a contact
  s/S : Save contacts to file
  q/Q : Quit

  IMPORTANT: Press s to save before you quit, or new contacts
  will be lost.


EXAMPLE
-------
  enter the choice
  c
  enter name
  Balu
  enter the phonenumber
  9876543210
  Do you want to add another number to the same name (Y/N): n
  Do you want to add email (Y/N): y
  Enter email: balu@gmail.com
  Do you want to add address (Y/N): n
  Contact created successfully

  enter the choice
  p
  name:Balu
  phone number[1] :9876543210
  email:balu@gmail.com
  address:Not Available


PROGRAM FLOW (FLOW CHART)
-------------------------
  (Picture version: images/flowchart.png)

                  +-------+
                  | Start |
                  +-------+
                      |
                      v
            +-------------------+
            |  load_contacts()  |
            +-------------------+
                      |
                      v
        +------------------------------+
   +--> |  Show menu, read the choice  |
   |    +------------------------------+
   |                  |
   |                  v
   |           < Which choice? >
   |                  |
   |    +-------+-----+-----+-------+-------+-------+
   |    |       |     |     |       |       |       |
   |    c       p     d     f       e       s       q
   |    |       |     |     |       |       |       |
   |    v       v     v     v       v       v       v
   |  create display delete find   edit    save   free_contacts()
   |    |       |     |     |       |       |       |
   +----+-------+-----+-----+-------+-------+       v
                                                  +------+
                                                  | End  |
                                                  +------+


PROJECT FILES
-------------
  main.c        Shows the menu and calls the functions
  create.c      create_contact()   adds a contact
  display.c     display_contact()  shows all contacts
  search.c      search_contact()   finds a contact
  edit.c        edit_contact()     changes a contact
  delete.c      delete_contact()   removes a contact
  save.c        save_contacts()    writes contacts to the file
  file1.c       load_contacts()    reads contacts from the file
  free.c        free_contacts()    frees memory at the end
  phonebook.h   Structure, limits and function names
  Makefile      Compiles the project
  images/       Diagrams (flow chart, linked list, save and load)
  readme.txt    This file


HOW IT WORKS
------------
Every contact is stored in one structure (CONTACT), and the
structures are joined together like a chain. This is a singly
linked list.

  head --> [Balu] --> [Anu] --> [Kiran] --> NULL

Each structure has a "next" pointer that points to the next
contact.

Saving  : pressing s writes every contact to phonebook.dat.
Loading : when the program starts it reads phonebook.dat and
          builds the list again. On the first run there is no
          file, so the phone book starts empty.

The saved file is plain text:

  =============== CONTACT 1 ===============
  Name    :Balu
  Count   :1
  Phone number[1] :9876543210
  Email    :balu@gmail.com
  Address  :Not Available


HOW TO COMPILE
--------------
  Needs gcc and make:   sudo apt install gcc make

      make              Compile the project
      make run          Compile and run
      make clean        Delete compiled files

  Add a file    : copy the new .c file into the folder, run make
  Remove a file : delete it, then run make clean and make


DESIGN HIGHLIGHTS
-----------------
  - Linked list: no fixed contact limit, delete only changes
    pointers.
  - CONTACT **head is used in create, delete, load and free
    because they can change the first node.
  - Text file: easy to read and debug.
  - One function per file: easy to understand and change.
  - Every malloc has a matching free.


KNOWN LIMITATIONS
-----------------
  - A phone number can have up to 10 characters.
  - Names are case sensitive (ravi and Ravi are different).
  - Search is by exact name only.
  - Very long input can overflow a field. Using fgets or width
    limits like %49[^\n] would fix this.


FUTURE IMPROVEMENTS
-------------------
  - Auto save on quit
  - Search by phone number or part of a name
  - Sort contacts by name
  - Check phone number and email format


AUTHOR
------
  Name : Balaji Pidikiti
  ID   : V25HE11B5

==============================================================
