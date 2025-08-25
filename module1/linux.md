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

---

