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

# 📌 cp and grep commands in Linux(ubuntu):

---

### 35. `cp filename newFileName`

**Use:** Copy files.

```bash
$ cp notes.txt notes_backup.txt
```

**Output:**
👉 A new copy is created.

```bash
$ ls
notes.txt  notes_backup.txt
```

---

### 36. `cp -r directoryName newDirName`

**Use:** Copy an entire directory (empty or with files).

```bash
$ cp -r projects projects_backup
```

**Output:**
👉 Copies the whole `projects` folder to `projects_backup`.

**Extra example – Copy specific extensions:**

```bash
$ cp folder/*.txt backup/
```

👉 Copies all `.txt` files to `backup/`.

---

### 37. `grep "text" filename`

**Use:** Search for a specific word/text (case-sensitive).

```bash
$ grep "Hello" story.txt
```

**Output:**

```
Hello World from Linux
```

---

### 38. `grep -i "text" filename`

**Use:** Case-insensitive search.

```bash
$ grep -i "hello" story.txt
```

**Output:**

```
Hello World from Linux
hello everyone
```

---

### 39. `grep -in "text" filename`

**Use:** Search with line numbers (case-insensitive).

```bash
$ grep -in "hello" story.txt
```

**Output:**

```
1:Hello World from Linux
3:hello everyone
```

---

### 40. `grep -v "text" filename`

**Use:** Show all lines **except** those containing the given text.

```bash
$ grep -v "hello" story.txt
```

**Output:**

```
This is line two
Linux is powerful
```

---

### 41. `grep -e "text1" -e "text2" filename`

**Use:** Search for multiple patterns.

```bash
$ grep -e "Linux" -e "World" story.txt
```

**Output:**

```
Hello World from Linux
Linux is powerful
```

---

### 42. `egrep "(word1|word2)" filename`

**Use:** Extended regex search (multiple matches).

```bash
$ egrep "(Hyderabad|Mumbai)" cities.txt
```

**Output:**

```
Hyderabad
Mumbai
```

---

### 43. `grep "^letter" filename`

**Use:** Find lines starting with a given letter/word.

```bash
$ grep "^H" story.txt
```

**Output:**

```
Hello World from Linux
Hi there
```

---

### 44. `grep "letter$" filename`

**Use:** Find lines ending with a given letter/word.

```bash
$ grep "Linux$" story.txt
```

**Output:**

```
Hello World from Linux
```

---

### 45. `fgrep "text" filename`

**Use:** Search for exact string (no regex interpretation).
👉 Faster than `grep` when you don’t want regex.

```bash
$ fgrep "a.b" data.txt
```

**Output:**
👉 Finds only exact `"a.b"`, not regex meaning (`a` followed by any char and `b`).

---

### 46. `wc filename` (Word Count)

**Use:** Counts **lines, words, and characters**.

```bash
$ wc story.txt
```

**Output:**

```
  3   15   80 story.txt
```

👉 (lines, words, bytes).

---

### 47. `wc -l filename`

**Use:** Show only line count.

```bash
$ wc -l story.txt
```

**Output:**

```
3 story.txt
```

**Also:**

```bash
$ wc -w story.txt   # word count
$ wc -c story.txt   # character count
```

---

### 48. `wc -c filename`

**Use:** Show only character/byte count.

```bash
$ wc -c story.txt
```

**Output:**

```
80 story.txt
```

---

### 49. `uniq filename`

**Use:** Removes duplicate lines (consecutive only).

```bash
$ cat data.txt
apple
apple
banana
banana
orange
```

```bash
$ uniq data.txt
apple
banana
orange
```

---

### 50. `sort filename`

**Use:** Sort lines alphabetically.

```bash
$ cat fruits.txt
banana
apple
orange
```

```bash
$ sort fruits.txt
apple
banana
orange
```

---

### 51. `sort filename > newFilename`

**Use:** Save sorted output into a new file.

```bash
$ sort fruits.txt > sorted_fruits.txt
$ cat sorted_fruits.txt
apple
banana
orange
```

👉 You can then run `uniq` on it.

---

### 52. `uniq -d filename`

**Use:** Show only duplicate lines.

```bash
$ cat data.txt
apple
apple
banana
orange
orange
```

```bash
$ uniq -d data.txt
apple
orange
```

---

### 53. `sort -n filename`

**Use:** Sort numbers (instead of alphabetically).

```bash
$ cat numbers.txt
10
2
30
5
```

```bash
$ sort -n numbers.txt
2
5
10
30
```

---

# 📌 GREP Family Quick Summary

| Command                   | Use                      | Example                           | Output                           |                  |            |
| ------------------------- | ------------------------ | --------------------------------- | -------------------------------- | ---------------- | ---------- |
| `grep "text" file`        | Case-sensitive search    | `grep "Hello" file.txt`           | Matches `Hello`                  |                  |            |
| `grep -i "text" file`     | Case-insensitive         | `grep -i "hello" file.txt`        | Matches `Hello` and `hello`      |                  |            |
| `grep -n "text" file`     | Show line numbers        | `grep -n "Linux" file.txt`        | `2:Linux is cool`                |                  |            |
| `grep -v "text" file`     | Invert match (exclude)   | `grep -v "Linux" file.txt`        | All lines without `Linux`        |                  |            |
| `grep -e "a" -e "b" file` | Multiple patterns        | `grep -e "dog" -e "cat" file.txt` | Finds both                       |                  |            |
| \`egrep "(a               | b)" file\`               | Regex OR search                   | \`egrep "(dog                    | cat)" file.txt\` | Finds both |
| `grep "^word" file`       | Lines starting with word | `grep "^Hi" file.txt`             | Matches lines starting with `Hi` |                  |            |
| `grep "word$" file`       | Lines ending with word   | `grep "end$" file.txt`            | Matches lines ending with `end`  |                  |            |
| `fgrep "a.b" file`        | Exact match (no regex)   | `fgrep "a.b" file.txt`            | Finds only literal `a.b`         |                  |            |

---

Perfect 🚀 Now we’re moving into **file preview (head/tail), process management (ps, kill, top, jobs), redirection (>, xargs), and priority (nice)**.
I’ll continue like before — **explanation + multiple examples (3–4 each) + outputs**.

---

# 📌 head tail top etc 

---

### 54. `head filename`

**Use:** Displays the **first 10 lines** of a file.

**Examples:**

```bash
$ head story.txt
```

Output → First 10 lines.

```bash
$ head /etc/passwd
```

Output → Shows first 10 system users.

```bash
$ head numbers.txt
```

Output → First 10 numbers.

---

### 55. `head -5 filename`

**Use:** Displays the **first 5 lines**.

**Examples:**

```bash
$ head -5 story.txt
```

Output → Only 5 lines.

```bash
$ head -5 /etc/passwd
```

Output → First 5 users.

```bash
$ head -5 log.txt
```

Output → First 5 log entries.

---

### 56. `tail filename`

**Use:** Displays the **last 10 lines**.

**Examples:**

```bash
$ tail story.txt
```

Output → Last 10 lines of story.

```bash
$ tail /etc/passwd
```

Output → Last 10 users.

```bash
$ tail log.txt
```

Output → Last 10 logs.

---

### 57. `tail -5 filename`

**Use:** Displays the **last 5 lines**.

**Examples:**

```bash
$ tail -5 story.txt
```

Output → Last 5 lines.

```bash
$ tail -5 log.txt
```

Output → Last 5 logs.

```bash
$ tail -5 numbers.txt
```

Output → Last 5 numbers.

---

### 58. `head -20 filename | tail -5`

**Use:** Show **lines 16–20** (head first 20 → tail last 5).

**Examples:**

```bash
$ head -20 story.txt | tail -5
```

Output → Lines 16–20.

```bash
$ head -50 log.txt | tail -10
```

Output → Lines 41–50.

```bash
$ head -20 story.txt | tail -5 | tee newfile.txt
```

Output → Saves those 5 lines to `newfile.txt` and also prints on screen.

---

### 59. `ls -l > newfilename`

**Use:** Redirects directory listing into a file.

**Examples:**

```bash
$ ls -l > files.txt
```

👉 Creates `files.txt` with list of files.

```bash
$ ls -l /etc > etc_list.txt
```

👉 Save `/etc` list.

```bash
$ ls -l Documents > doc_list.txt
```

👉 Save Documents list.

---

### 60. `cat unwanted.txt | xargs rm`

**Use:** Deletes files listed in another file.

**Examples:**

```bash
$ cat unwanted.txt
temp1.txt
temp2.txt

$ cat unwanted.txt | xargs rm
```

👉 Deletes both files.

```bash
$ ls *.log > deleteLogs.txt
$ cat deleteLogs.txt | xargs rm
```

👉 Deletes all `.log` files.

```bash
$ cat files.txt | xargs rm -i
```

👉 Interactive delete for safety.

---

### 61. `ps`

**Use:** Show processes of current shell.

**Examples:**

```bash
$ ps
```

Output:

```
 PID TTY          TIME CMD
1234 pts/0    00:00:00 bash
1256 pts/0    00:00:00 ps
```

```bash
$ sleep 60 &
$ ps
```

Output shows `sleep` process.

```bash
$ ps | grep bash
```

👉 Filters only bash process.

---

### 62. `kill <pid>`

**Use:** Kill a process by PID.

**Examples:**

```bash
$ sleep 500 &
[1] 2345
$ kill 2345
```

```bash
$ ps
$ kill -9 3000
```

👉 Force kill process.

```bash
$ kill $(pidof firefox)
```

👉 Kill Firefox.

---

### 63. `ps -f`

**Use:** Show processes in **full format**.

**Examples:**

```bash
$ ps -f
```

Output includes UID, PID, PPID, CMD.

```bash
$ ps -f | grep bash
```

```bash
$ sleep 60 &
$ ps -f | grep sleep
```

---

### 64. `ps -ef`

**Use:** Show **all processes** in system (full listing).

**Examples:**

```bash
$ ps -ef
```

```bash
$ ps -ef | grep root
```

```bash
$ ps -ef | wc -l
```

👉 Count processes.

---

### 65. `sleep seconds`

**Use:** Pause execution for some time.

**Examples:**

```bash
$ sleep 10
```

👉 Sleeps 10s.

```bash
$ sleep 120
```

👉 Sleeps 2 min.

```bash
$ sleep 5 && echo "done"
```

👉 Waits 5s then prints `done`.

---

### 66. `sleep 120 & ps -f`

**Use:** Run sleep in background (`&`) and then check process.

**Examples:**

```bash
$ sleep 120 &
[1] 3210
$ ps -f | grep sleep
```

```bash
$ sleep 60 & sleep 30 &
$ ps -f | grep sleep
```

```bash
$ sleep 15 & echo "started in background"
```

---

### 67. `nohup command`

**Use:** Run command immune to hangups (keeps running even after logout).

**Examples:**

```bash
$ nohup sleep 500 &
```

👉 Keeps running even if you close terminal.

```bash
$ nohup mysqldump testdb -u root -p > dump.sql &
```

👉 Backup database safely.

```bash
$ nohup python script.py > log.txt &
```

---

### 68. `top`

**Use:** Real-time process monitor.

**Examples:**

```bash
$ top
```

👉 Shows CPU, memory usage.

```bash
$ top -u omar
```

👉 Only processes for user.

```bash
$ top -p 1234
```

👉 Show specific PID.

---

### 69. `ps -aux`

**Use:** Show all processes with CPU/memory usage.

**Examples:**

```bash
$ ps -aux
```

```bash
$ ps -aux | grep firefox
```

```bash
$ ps -aux --sort=-%mem | head -5
```

👉 Top 5 memory hogs.

---

### 70. `jobs`

**Use:** Show background jobs in current shell.

**Examples:**

```bash
$ sleep 50 &
$ jobs
```

Output → `[1]+ Running sleep 50 &`

```bash
$ sleep 20 &
$ jobs
```

```bash
$ jobs -l
```

👉 Shows PID also.

---

### 71. `nice -n value command`

**Use:** Run a command with **priority** (-20 = highest, 19 = lowest).

**Examples:**

```bash
$ nice -n 5 sleep 100 &
```

```bash
$ nice -n -1 python heavy_script.py
```

```bash
$ ps -l | grep python
```

👉 Shows NI (nice value).

---

Perfect 💯 Omer, now you’re covering **echo, variables, package management, users, permissions** — this is golden because these are the building blocks of shell scripting + system admin.

I’ll continue in the same **format (explanation + examples + outputs)** so it becomes your **Linux Handbook (Part 4)**.

---

# 📌 Linux Commands chmod and wget (curl)

---

### 72. `echo "your content"`

**Use:** Prints text to terminal.

**Examples:**

```bash
$ echo "Hello Linux"
Hello Linux

$ echo "Welcome Omer"
Welcome Omer
```

---

### 73. `echo -e "some content \t here"`

**Use:** `-e` enables escape sequences like `\t` (tab), `\n` (new line).

**Examples:**

```bash
$ echo -e "Omer\tAli"
Omer    Ali

$ echo -e "Line1\nLine2"
Line1
Line2
```

---

### 74. Variables in Ubuntu

Linux **doesn’t require datatypes**. Just assign with `=`.
Use `$` to print values.

**Examples:**

```bash
$ x=10
$ echo $x
10

$ greet="good evening"
$ echo "Hi Omer $greet"
Hi Omer good evening
```

⚠ Always use **double quotes ("")** when referencing variables, not single quotes ('').

---

### 75. `echo "$USERNAME"`

**Use:** Prints current system username.

```bash
$ echo "$USERNAME"
omer
```

---

### 76. `echo $?`

**Use:** Shows exit status of last command.

* `0` = success ✅
* `1` = file not found ❌
* `2` = invalid usage ⚠

**Examples:**

```bash
$ ls
$ echo $?
0

$ ls notafile.txt
ls: cannot access 'notafile.txt': No such file or directory
$ echo $?
1
```

---

### 77. `echo $0`

**Use:** Shows current shell or script name.

**Examples:**

```bash
$ echo $0
bash
```

If running inside a script `myscript.sh`:

```bash
$ bash myscript.sh
$ echo $0
myscript.sh
```

---

## 📦 Software Installation

### 78. `apt`

**Use:** Package manager for Ubuntu/Debian.

---

### 79. `sudo apt update`

**Use:** Refresh package list.

```bash
$ sudo apt update
[sudo] password for omer:
Hit:1 http://archive.ubuntu.com/ubuntu focal InRelease
...
```

---

### 80. `wget <link>`

**Use:** Download files from internet.

```bash
$ wget http://example.com/app.zip
```

---

### 81. `curl -O <link>`

**Use:** Download file with curl.

```bash
$ curl -O http://example.com/app.zip
```

---

### 82. `unzip filename.zip`

**Use:** Extract zip archive.

```bash
$ unzip app.zip
Archive:  app.zip
 extracting: app/setup.sh
```

---

### 83. `ls -l filename`

**Use:** Shows file permissions.

```bash
$ ls -l citys.txt
-rw-r--r-- 1 omer omer 14590 Sep  1 19:44 citys.txt
```

* `-` = file
* `r` = read, `w` = write, `x` = execute
* First group = owner, second = group, third = others

---

### 84. `cat /etc/passwd`

**Use:** List all users on the system.

**Example Output (shortened):**

```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
omar:x:1000:1000:,,,:/home/omar:/bin/bash
```

---

### 88. `sudo useradd -m -d /home/raju -s /bin/bash raju`

**Use:** Create new user.

* `-m` → create home dir
* `-d` → specify home path
* `-s` → specify shell

```bash
$ sudo useradd -m -d /home/raju -s /bin/bash raju
$ sudo passwd raju
Enter new UNIX password:
```

---

### 89. `su username`

**Use:** Switch to another user.

```bash
$ su raju
Password:
$ cd
```

---

## 🔐 File Permissions

* **r = 4 (read)**
* **w = 2 (write)**
* **x = 1 (execute)**

3 types of users:

* `u` = owner
* `g` = group
* `o` = others
* `a` = all

---

### 90. `chmod u+rwx filename`

**Use:** Give owner all permissions.

```bash
$ chmod u+rwx script.sh
```

---

### 91. `chmod u-rwx filename`

**Use:** Remove all permissions from owner.

---

### 92. `chmod ugo-rwx filename`

**Use:** Remove all permissions from everyone.

---

### 93. `chmod a+rx filename`

**Use:** Give read+execute to all.

---

### 94. `chmod a-rwx filename`

**Use:** Remove all permissions from all users.

---

### 95. `chmod 777 filename`

**Use:** Numeric mode. Everyone gets full access.

```bash
$ chmod 777 script.sh
```

Other examples:

* `chmod 000 file` → no access ❌
* `chmod 644 file` → owner read/write, others read only
* `chmod 755 script.sh` → common for executables

---

