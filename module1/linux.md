## 📌 Linux Commands Explained with Examples

---

### 1. `clear`

**Use:** Clears the terminal screen.

```bash
$ clear
```

**Output:**
👉 The screen becomes blank (no text output, just clears the history view).

---

### 2. `pwd` (Present Working Directory)

**Use:** Shows the full path of the current working directory.

```bash
$ pwd
```

**Output:**

```
/home/omar/projects
```

---

### 3. `whoami`

**Use:** Displays the username of the current Linux user.

```bash
$ whoami
```

**Output:**

```
omar
```

---

### 4. `hostname`

**Use:** Shows the system (computer) name.

```bash
$ hostname
```

**Output:**

```
omar-Laptop
```

---

### 5. `hostname -i`

**Use:** Shows the IP address of your system.

```bash
$ hostname -i
```

**Output:**

```
192.168.1.10
```

---

### 6. `who`

**Use:** Shows who is logged into the system.

```bash
$ who
```

**Output:**

```
omar     tty7         2025-08-25  19:55 (:0)
```

---

### 7. `man command-name`

**Use:** Opens the manual/help page for a command. Exit with **`q`**.

```bash
$ man ls
```

**Output (part of manual):**

```
LS(1)                     User Commands                     LS(1)

NAME
       ls - list directory contents
```

---

### 8. `sudo su`

**Use:** Switch to root (superuser). Will ask for password.

```bash
$ sudo su
[sudo] password for omar: 
```

**Output:**

```
root@omar-Laptop:/home/omar#
```

👉 Notice the prompt changes from `$` to `#`.

---

### 9. `ls` (List)

**Use:** Shows files and directories in current directory.

```bash
$ ls
```

**Output:**

```
Documents  Downloads  Music  Pictures  Videos
```

---

### 10. `ls -l`

**Use:** Shows detailed list (permissions, owner, size, creation date).

```bash
$ ls -l
```

**Output:**

```
-rw-r--r--  1 omar omar   1234 Aug 25 19:40 notes.txt
drwxr-xr-x  2 omar omar   4096 Aug 24 10:10 projects
```

---

### 11. `ls -la`

**Use:** Shows all files including hidden (`.` files).

```bash
$ ls -la
```

**Output:**

```
drwxr-xr-x  5 omar omar 4096 Aug 25 20:00 .
drwxr-xr-x 18 omar omar 4096 Aug 25 19:30 ..
-rw-r--r--  1 omar omar   220 Apr  4  2025 .bashrc
-rw-r--r--  1 omar omar  1234 Aug 25 19:40 notes.txt
```

---

### 12. `ls /`

**Use:** Shows contents of the root directory `/`.

```bash
$ ls /
```

**Output:**

```
bin  boot  dev  etc  home  lib  media  mnt  opt  root  tmp  usr  var
```

---

### 13. `ls -r`

**Use:** Lists in reverse order (alphabetical descending).

```bash
$ ls -r
```

**Output:**

```
Videos  Pictures  Music  Downloads  Documents
```

---

### 14. `ls -R`

**Use:** Recursive listing (shows all sub-directories too).

```bash
$ ls -R
```

**Output:**

```
.:
Documents  Music

./Documents:
resume.pdf  project.txt

./Music:
song.mp3
```

---

### 15. `ls *.*`

**Use:** Lists files that contain a dot (`.`) in the name.

```bash
$ ls *.*
```

**Output:**

```
notes.txt  resume.pdf  song.mp3
```

---

### 16. `ls ???`

**Use:** Lists files with exactly 3 characters in the name.

```bash
$ ls ???
```

**Output:**

```
doc  img  app
```

---

### 17. `ls [a-d]*.*`

**Use:** Lists files starting with `a` to `d` and having `.`.

```bash
$ ls [a-d]*.*
```

**Output:**

```
app.js  code.c  data.txt
```

---

### 18. `ls [!str]*`

**Use:** Lists files that do **not** start with `s`, `t`, or `r`.

```bash
$ ls [!str]*
```

**Output:**

```
app.js  data.txt  myfile.cpp
```

---

## 📂 Directory Operations

---

### 19. `mkdir folderName`

**Use:** Create a new directory.

```bash
$ mkdir myFolder
```

**Output:**
👉 No message, but directory created.

```bash
$ ls
Documents  Downloads  myFolder
```

---

### 20. `mkdir -p folderName/subfolder`

**Use:** Create nested directories.

```bash
$ mkdir -p projects/2025/august
```

**Output:**
👉 Creates full path, even if parent folders don’t exist.

---

### 21. `rmdir folderName`

**Use:** Remove empty directory.

```bash
$ rmdir myFolder
```

**Output:**
👉 Directory removed (only if empty).

---

### 22. `rm -r folderName`

**Use:** Delete directory and all its contents.

```bash
$ rm -r projects
```

**Output:**
👉 Deletes directory recursively (⚠ irreversible).

---

### 23. `rmdir -i folderName`

**Use:** Interactive remove (asks before deleting).

```bash
$ rmdir -i myFolder
rmdir: remove directory 'myFolder'? y
```

## 📌 Linux Commands (Files + Navigation)

---

### 24. `touch filename.extension`

**Use:** Creates an empty file.

```bash
$ touch notes.txt
```

**Output:**
👉 No message. File created.

```bash
$ ls
notes.txt
```

---

### 25. `cat > filename.extension`

**Use:** Create a new file and directly write data into it (overwrites existing content). End with **CTRL+C**.

```bash
$ cat > story.txt
This is my first line.
This is my second line.
^C
```

**Output:**
👉 File saved with content.

---

### 26. `cat filename`

**Use:** Read contents of a file.

```bash
$ cat story.txt
```

**Output:**

```
This is my first line.
This is my second line.
```

---

### 27. `cat >> filename`

**Use:** Append (add) more data to an existing file.

```bash
$ cat >> story.txt
This is my third line.
^C
```

```bash
$ cat story.txt
```

**Output:**

```
This is my first line.
This is my second line.
This is my third line.
```

---

### 28. `nano filename`

**Use:** Open a text editor to create or edit a file. Save with **CTRL+O + Enter**, Exit with **CTRL+X**.

```bash
$ nano story.txt
```

**Output (inside editor):**

```
GNU nano 6.2               story.txt
This is my first line.
This is my second line.
This is my third line.
```

---

### 29. `cd` (Change Directory)

**Use:** Moves into another directory.

```bash
$ cd Documents
$ pwd
/home/omar/Documents
```

---

### 30. `cd ..`

**Use:** Go back one directory (parent).

```bash
$ cd ..
$ pwd
/home/omar
```

👉 **Relative path example:**

```bash
$ cd home/omar/projects
```

---

### 31. `sudo su`

**Use:** Become the root user (superuser). Needs password.

```bash
$ sudo su
[sudo] password for omar:
```

**Output:**

```
root@omar-Laptop:/home/omar#
```

👉 After this, many commands don’t need `sudo`.

---

### 32. `rm filename`

**Use:** Delete a file.

```bash
$ rm notes.txt
```

**Output:**
👉 File deleted silently (no confirmation by default).

👉 To delete multiple files:

```bash
$ rm file1.txt file2.txt
```

---

### 33. `rm -i filename`

**Use:** Interactive delete (asks before removing).

```bash
$ rm -i story.txt
rm: remove regular file 'story.txt'? y
```

---

### 34. `mv`

**Use:** Move or rename files/directories.

1️⃣ **Rename a file:**

```bash
$ mv story.txt myStory.txt
```

2️⃣ **Move file to another directory:**

```bash
$ mv myStory.txt Documents/
```

3️⃣ **Rename and move:**

```bash
$ mv myStory.txt Documents/newStory.txt
```

**Output:**
👉 File moved/renamed, no extra message.

---

