# Linux Commands: Beginner ➜ Advanced (With Simple Explanations, Examples, and Outputs)

This README is a hands-on guide to common Linux commands. It starts from basics and gradually goes toward advanced topics. Every command is explained in simple words and demonstrated with examples and sample outputs. It also covers file permissions, users/groups, and a full beginner-friendly guide to cron jobs (crontab).

Conventions:
- We call a “folder” a “directory” in Linux.
- `$` prompt means run as a normal user. `#` prompt means run as root (administrator).
- Outputs here are examples. Your system might show slightly different results.

Tip: You can always learn more about any command with: `man <command>` and press `q` to quit the manual.

---

## 1) Screen, Identity, and System Basics

### 1. clear — Clear the terminal screen
- What it does: Wipes the current terminal view. It doesn’t delete anything—just clears the screen.
- Syntax: `clear`

Examples:
1) `$ clear`
   Output: The terminal screen is cleared.
2) `$ Ctrl+L` (keyboard shortcut)
   Output: Same effect as `clear`.
3) `$ printf "\033c"` (reset and clear)
   Output: Clears the screen (more than clear).
4) `$ tput reset`
   Output: Clears the screen similarly.

---

### 2. pwd — Print working directory
- What it does: Shows where you are in the filesystem.
- Syntax: `pwd`

Examples:
1) `$ pwd`
   Output: `/home/omar`
2) `$ cd /var/log && pwd`
   Output: `/var/log`
3) `$ (cd /etc; pwd)`
   Output: `/etc`
4) `$ pwd -P` (physical path, no symlinks)
   Output: e.g., `/home/omar`

---

### 3. whoami — Show your current username
- Syntax: `whoami`

Examples:
1) `$ whoami`
   Output: `omar`
2) `$ sudo whoami`
   Output: `root`
3) `$ echo "I am $(whoami)"`
   Output: `I am omar`
4) `$ id -un` (alternative)
   Output: `omar`

---

### 4. hostname — Show the system’s hostname
- What it does: Displays your machine name.
- Syntax: `hostname`

Examples:
1) `$ hostname`
   Output: `my-laptop`
2) `$ hostnamectl hostname`
   Output: e.g., `my-laptop` (more details with `hostnamectl`)
3) `$ cat /etc/hostname`
   Output: `my-laptop`
4) `$ sudo hostname new-name` (temporary until reboot)
   Output: No output; hostname becomes `new-name`.

---

### 5. hostname -i — Show IP address
- Note: On some systems, `hostname -I` (capital i) shows all assigned IPs. `-i` may show only loopback or behave differently depending on distro.
- Syntax: `hostname -i` or `hostname -I`

Examples:
1) `$ hostname -I`
   Output: `192.168.1.20 10.0.0.5`
2) `$ hostname -i`
   Output: `127.0.1.1` (varies)
3) `$ ip addr show | grep "inet "`
   Output: Lines with IPs like `inet 192.168.1.20/24 ...`
4) `$ curl ifconfig.me`
   Output: Your public IP, e.g., `203.0.113.5`

---

### 6. who — Show logged-in users
- Syntax: `who`

Examples:
1) `$ who`
   Output: `omar tty2  2025-09-04 09:12`
2) `$ who -H` (header)
   Output: With column headers.
3) `$ w` (more detail: load + processes)
   Output: Shows who and what they’re doing.
4) `$ users`
   Output: `omar root`

---

### 7. man command-name — Manual pages
- What it does: Opens the manual/help for a command. Press `q` to quit.
- Syntax: `man <command>`

Examples:
1) `$ man ls`
   Output: LS manual opens.
2) `$ man -k network` (search topics)
   Output: List of network-related pages.
3) `$ man 5 crontab` (section 5: file formats)
   Output: Crontab file format manual.
4) `$ info coreutils 'ls invocation'` (alternative docs)
   Output: Info page about `ls`.

---

### 8. sudo su — Switch to root user
- What it does: Asks for your password, then opens a root shell. As root, you don’t use `sudo` (you already have full permissions).
- Syntax: `sudo su`

Examples:
1) `$ sudo su`
   Output: Prompt changes to `#`; you are root.
2) `$ sudo -i`
   Output: Root login shell.
3) `$ su -` (if you know the root password)
   Output: Root shell after entering root’s password.
4) `$ exit`
   Output: Leaves root shell back to your user.

Warning: Be careful as root; you can change or delete critical files.

---

## 2) Listing Files and Directories (ls and patterns)

### 9. ls — List directory contents
- Syntax: `ls [options] [path]`
- “Directory” is the Linux term for “folder.”

Examples:
1) `$ ls`
   Output: `Desktop Documents Downloads file.txt`
2) `$ ls -l`
   Output: Long format with permissions:
   `-rw-r--r-- 1 omar omar 14590 Sep  1 19:44 citys.txt`
3) `$ ls -a`
   Output: Includes hidden files like `.bashrc`
4) `$ ls -lh`
   Output: Human-readable sizes, e.g., `14K`

---

### 10. ls -l — Long listing format
- Shows permissions, owner, group, size, and date.

Examples:
1) `$ ls -l`
   Output-like:
   `-rw-r--r-- 1 omar omar 14590 Sep  1 19:44 citys.txt`
2) `$ ls -l /etc/hosts`
   Output: One detailed line.
3) `$ ls -l /var/log | head`
   Output: First 10 entries with details.
4) `$ ls -l --time-style=long-iso`
   Output: ISO timestamps.

---

### 11. ls -la — Long + all (including hidden)
- Shows hidden files (names starting with a dot).

Examples:
1) `$ ls -la`
   Output: includes `.` and `..` and files like `.profile`
2) `$ ls -la ~`
   Output: Hidden files in home directory.
3) `$ ls -la /etc | grep "^\."`
   Output: Hidden files in /etc.
4) `$ ls -la --group-directories-first`
   Output: Folders first, then files.

---

### 12. ls / — List root directory
- Syntax: `ls /`

Examples:
1) `$ ls /`
   Output: `bin  boot  dev  etc  home  lib ...`
2) `$ ls -l /`
   Output: Detailed listing of root.
3) `$ ls -a /`
   Output: Hidden items (rare at /).
4) `$ ls -l /home`
   Output: User directories.

---

### 13. ls -r — Reverse order (reverse alphabetical)
- Syntax: `ls -r`

Examples:
1) `$ ls -r`
   Output: Files listed Z ➜ A.
2) `$ ls -ltr` (time sort, reverse, long)
   Output: Oldest first.
3) `$ ls -1r`
   Output: One per line, reverse.
4) `$ ls -r *.txt`
   Output: Matching files in reverse.

---

### 14. ls -R — Recursive listing
- Lists directories and their subdirectories recursively.

Examples:
1) `$ ls -R`
   Output: Shows current directory and all nested contents.
2) `$ ls -R /etc | less`
   Output: Page through recursive output.
3) `$ ls -lR . | grep ".conf"`
   Output: Find all .conf files under current.
4) `$ ls -d **/` (with bash globstar)
   Output: All directories recursively.

---

### 15. ls *.* — Globbing for names containing a dot
- `*.*` matches files like name.ext

Examples:
1) `$ ls *.*`
   Output: `notes.txt photo.jpg`
2) `$ ls *.txt`
   Output: All .txt files.
3) `$ ls *.* | wc -l`
   Output: Number of such files.
4) `$ echo *.*`
   Output: Prints filenames matching pattern.

---

### 16. ls ??? — Exactly 3-character filenames
- `?` matches exactly one character.

Examples:
1) `$ ls ???`
   Output: `app doc bin` (if they exist)
2) `$ ls ??`
   Output: Files with 2-char names.
3) `$ ls a??`
   Output: 3-char names starting with a.
4) `$ ls ???.txt`
   Output: 3-char base name with .txt extension.

---

### 17. ls [a-d]*.* — Range glob
- Matches files starting with a, b, c, or d and containing a dot.

Examples:
1) `$ ls [a-d]*.*`
   Output: `app.log beta.txt cat.jpg data.csv`
2) `$ ls [!a-d]*.*` (not a-d)
   Output: Files starting with letters outside a–d.
3) `$ ls [0-9]*`
   Output: Names starting with a digit.
4) `$ ls *[0-9].txt`
   Output: .txt files ending with a digit.

---

### 18. ls [!str] — “Not” character class
- In shells, `[!str]` means “not s, t, or r” for that single position. Example: `[!abc]*` = names not starting with a, b, or c.

Examples:
1) `$ ls [!abc]*`
   Output: Files not starting with a, b, or c.
2) `$ ls ???[!0-9]`
   Output: 4-char names where last char is not a number.
3) `$ ls [!A-Z]*`
   Output: Names not starting with uppercase letter.
4) `$ ls *[!x]`
   Output: Names not ending with x.

Note: The `!` goes inside `[]` for POSIX shells.

---

## 3) Creating and Deleting Directories

### 19. mkdir folderName — Create a directory
Examples:
1) `$ mkdir projects`
   Output: Creates projects.
2) `$ mkdir notes images`
   Output: Creates both.
3) `$ mkdir "My Docs"`
   Output: Creates directory with space in name.
4) `$ mkdir -m 755 public_dir`
   Output: Creates with specific permissions.

---

### 20. mkdir -p path — Create nested directories
Examples:
1) `$ mkdir -p a/b/c`
   Output: Creates a, b, c if needed.
2) `$ mkdir -p /tmp/demo/{logs,data}`
   Output: Creates /tmp/demo/logs and /tmp/demo/data.
3) `$ mkdir -p ./src/components/buttons`
   Output: Nested path.
4) `$ mkdir -p "$HOME"/backups/2025/09`
   Output: Multi-level path in home.

---

### 21. rmdir folderName — Remove empty directory
- Only works if the directory is empty.

Examples:
1) `$ rmdir emptydir`
   Output: Directory removed.
2) `$ rmdir empty1 empty2`
   Output: Removes both if empty.
3) `$ rmdir -p a/b/c` (remove parents if empty)
   Output: Removes c, b, a if each is empty.
4) `$ rmdir nonempty`
   Output: Error: Directory not empty.

Note: `rmdir` does NOT have `-i` on most systems. Use `rm -ri` for interactive recursive deletion.

---

### 22. rm -r folderName — Remove directory and contents
- Careful: Deletes everything inside.

Examples:
1) `$ rm -r old_project`
   Output: No output; directory removed.
2) `$ rm -rf build` (`-f` = force)
   Output: Removes without prompts.
3) `$ rm -ri temp` (interactive)
   Output: Asks before each removal.
4) `$ rm -r a b c`
   Output: Removes multiple directories.

---

### 23. rm -i — Interactive delete (safer)
Examples:
1) `$ rm -i file.txt`
   Output: `rm: remove regular file 'file.txt'? y`
2) `$ rm -ri important_dir`
   Output: Asks for each item inside.
3) `$ rm -i *.log`
   Output: Confirms each matching file.
4) `$ alias rm='rm -i'` (safety tip)
   Output: Makes rm interactive by default.

---

## 4) Files: Create, View, Edit, Move, Copy

### 24. touch filename — Create empty file or update timestamp
Examples:
1) `$ touch report.txt`
   Output: Creates report.txt
2) `$ touch a b c`
   Output: Creates 3 files.
3) `$ touch -t 202509041200 file`
   Output: Sets timestamp.
4) `$ touch {1..3}.txt`
   Output: 1.txt, 2.txt, 3.txt

---

### 25. cat > filename — Create and write (overwrite)
- Type content, then press Ctrl+C to finish (or Ctrl+D for EOF).
Examples:
1) `$ cat > notes.txt`
   Type:
   Hello
   Ctrl+C
   Output: File saved with “Hello”
2) `$ cat > poem.txt`
   Type lines…
   Ctrl+D
3) `$ cat > file.txt <<'EOF'
Line1
Line2
EOF`
   Output: File has Line1/Line2
4) `$ cat > script.sh` then add lines; Ctrl+D.

---

### 26. cat filename — Read a file
Examples:
1) `$ cat notes.txt`
   Output: Shows file content.
2) `$ cat /etc/hostname`
   Output: e.g., `my-laptop`
3) `$ cat -n notes.txt` (numbered lines)
   Output: Lines with numbers.
4) `$ cat file1 file2 > combined.txt`
   Output: merged into combined.txt

---

### 27. cat >> filename — Append to a file
Examples:
1) `$ cat >> notes.txt`
   Type:
   More lines…
   Ctrl+D
2) `$ echo "New line" >> notes.txt`
   Output: Appended line.
3) `$ printf "A\nB\n" >> list.txt`
   Output: Adds A and B.
4) `$ date >> log.txt`
   Output: Adds current date/time.

---

### 28. nano filename — Edit in terminal
- Save with Ctrl+O, press Enter; Exit with Ctrl+X.
Examples:
1) `$ nano notes.txt`
   Output: Edit notes.
2) `$ sudo nano /etc/hosts`
   Output: Edit system file (be careful).
3) `$ nano -B notes.txt` (backup)
   Output: Creates `notes.txt~`
4) `$ nano -m file` (mouse support)

---

### 29. cd — Change directory
Examples:
1) `$ cd /var/log`
   Output: Moves to /var/log
2) `$ cd` (no args)
   Output: Goes to home, e.g., /home/omar
3) `$ cd ..`
   Output: Up one directory.
4) `$ cd -`
   Output: Back to previous directory.

---

### 30. cd .. — Go one level up
Examples:
1) `$ pwd` → `/home/omar/projects/app`
   `$ cd ..` → `/home/omar/projects`
2) `$ cd ../../`
   Output: Up two levels.
3) `$ cd ../sibling`
   Output: Go to sibling directory.
4) `$ cd / && cd ..`
   Output: Stays at `/` (no parent).

Relative path example: `home/folderName` means from where you are, go into `home/folderName`. Absolute path starts with `/` like `/home/folderName`.

---

### 31. sudo su (root and sudo note)
- “It will ask the root user password and in the root directory all commands should be start with sudo” — Correction:
  - `sudo su` asks YOUR password (sudoers), then gives a root shell.
  - When you are root, you do NOT use sudo (you already have root).
  - The “root directory” is `/`. Being in `/` doesn’t change sudo usage.

Examples:
1) `$ sudo su` then `# ls /root`
2) `# apt update` (no sudo, you’re root)
3) `# exit` (return to user)
4) `$ sudo -s` (another way)

---

### 32. rm filename — Delete a file
Examples:
1) `$ rm file.txt`
   Output: File removed.
2) `$ rm -i file.txt`
   Output: Asks before removing.
3) `$ rm file1 file2 file3`
   Output: Multiple files removed.
4) `$ rm -- *.txt`
   Output: Remove all .txt (safe with `--` if names start with `-`)

---

### 33. rm -i filename — Confirm before delete
Examples:
1) `$ rm -i data.csv`
   Output: `remove regular file 'data.csv'? y`
2) `$ rm -i *.log`
   Output: Confirms each .log file.
3) `$ alias rm='rm -i'`
   Output: Make interactive by default.
4) `$ rm -I *.log` (ask once if >3 files)
   Output: Single prompt.

---

### 34. mv — Move or rename files/directories
Examples:
1) Rename file:
   `$ mv old.txt new.txt`
2) Move file:
   `$ mv report.txt docs/`
3) Rename directory:
   `$ mv photos images`
4) Move and rename:
   `$ mv notes.txt ../archive/notes-2025.txt`

---

### 35. cp filename newFileName — Copy files
Examples:
1) `$ cp a.txt b.txt`
   Output: b.txt is a copy of a.txt
2) `$ cp file.txt backup/file.txt`
   Output: Copy into another directory.
3) `$ cp -i file.txt file.txt.bak` (confirm overwrite)
4) `$ cp -p file.txt new.txt` (preserve times/permissions)

---

### 36. cp -r directoryName — Copy directories (recursive)
Examples:
1) `$ cp -r src src_backup`
2) `$ cp -r dir1 dir2 target_dir/`
3) `$ cp -r . /tmp/backup`
4) Copy only certain extensions:
   `$ cp folder/*.log logs/`

---

## 5) grep Family (Search Text)

Note: `egrep` and `fgrep` are considered legacy. Use `grep -E` (extended regex) and `grep -F` (fixed strings) instead.

Given a file `cities.txt`:
```
Hyderabad
Mumbai
Pune
HyderaBAD
Chennai
Delhi
mumbai
```

### 37. grep "pattern" filename — Case-sensitive search
Examples:
1) `$ grep "Mumbai" cities.txt`
   Output: `Mumbai`
2) `$ grep "Hyder" cities.txt`
   Output: `Hyderabad`
3) `$ grep "^P" cities.txt`
   Output: `Pune`
4) `$ grep "bad$" cities.txt`
   Output: `HyderaBAD` (case-sensitive)

---

### 38. grep -i — Case-insensitive
Examples:
1) `$ grep -i "mumbai" cities.txt`
   Output: `Mumbai` and `mumbai`
2) `$ grep -i "hydera" cities.txt`
   Output: `Hyderabad` and `HyderaBAD`
3) `$ grep -i "^d" cities.txt`
   Output: `Delhi`
4) `$ grep -i "CHENNAI" cities.txt`
   Output: `Chennai`

---

### 39. grep -n / -in — Show line numbers
Examples:
1) `$ grep -n "Mum" cities.txt`
   Output: `2:Mumbai`
2) `$ grep -in "mumbai" cities.txt`
   Output:
   `2:Mumbai`
   `7:mumbai`
3) `$ nl -ba cities.txt | grep -i "mumbai"`
   Output: Another way to include line numbers.
4) `$ awk '/mumbai/{print NR ":" $0}' cities.txt`
   Output: With awk.

---

### 40. grep -v — Invert match (show lines not matching)
Examples:
1) `$ grep -v "Mumbai" cities.txt`
   Output: All lines except `Mumbai`.
2) `$ grep -iv "mumbai" cities.txt`
   Output: Excludes any case of mumbai.
3) `$ grep -v "^#" file.conf`
   Output: All non-comment lines.
4) `$ grep -v "^$" file` (remove empty lines)
   Output: Non-empty lines.

---

### 41. grep -e — Multiple patterns
Examples:
1) `$ grep -e "Hyderabad" -e "Mumbai" cities.txt`
   Output: Lines containing either.
2) `$ grep -e "^H" -e "^M" cities.txt`
3) `$ grep -e "bad$" -e "^D" cities.txt`
4) `$ grep -ie "mumbai" -e "pune" cities.txt`

---

### 42. egrep "(A|B)" filename → grep -E "(A|B)"
Examples:
1) `$ grep -E "(Hyderabad|Mumbai)" cities.txt`
2) `$ grep -E "^(Pune|Delhi)$" cities.txt`
3) `$ grep -E "bad$|^Ch" cities.txt`
4) `$ grep -Ei "(mumbai|chennai)" cities.txt`

---

### 43. grep "^letter" filename — Beginning of line
Examples:
1) `$ grep "^H" cities.txt`
   Output: `Hyderabad` and `HyderaBAD`
2) `$ grep -i "^m" cities.txt`
   Output: `Mumbai`, `mumbai`
3) `$ grep "^..n" file` (two chars then n)
4) `$ grep "^[A-Z]" cities.txt` (uppercase start)

---

### 44. grep "letter$" filename — End of line
Examples:
1) `$ grep "i$" cities.txt`
   Output: `Delhi`
2) `$ grep -i "bad$" cities.txt`
   Output: `HyderaBAD`
3) `$ grep "ai$" cities.txt`
   Output: `Mumbai` (if lowercase matches, use -i)
4) `$ grep "e$" cities.txt`
   Output: `Pune`

---

### 45. fgrep "" filename → grep -F — Fixed strings (no regex)
Examples:
1) `$ grep -F "a.b" file` (matches literal `a.b`)
2) `$ grep -F -f patterns.txt file` (patterns from file)
3) `$ grep -F "[]" file` (matches literal [ ])
4) `$ grep -F ".*" file` (matches literal `.*`)

---

## 6) Counting and Sorting

Assume file `data.txt`:
```
apple
banana
apple
cherry
banana
date
```

### 46. wc filename — Count lines, words, bytes
Examples:
1) `$ wc data.txt`
   Output: `6 6 36 data.txt` (lines words bytes)
2) `$ wc -l data.txt`
   Output: `6 data.txt`
3) `$ wc -w data.txt`
   Output: `6 data.txt`
4) `$ wc -c data.txt`
   Output: `36 data.txt`

---

### 49. uniq filename — Remove adjacent duplicates
- Usually combined with `sort` first.
Examples:
1) `$ sort data.txt | uniq`
   Output:
   `apple
banana
cherry
date`
2) `$ uniq data.txt`
   Output: Removes only repeated adjacent lines (depends on file order).
3) `$ sort data.txt | uniq -c`
   Output: Counts for each unique:
   `2 apple
2 banana
1 cherry
1 date`
4) `$ sort data.txt | uniq -d`
   Output:
   `apple
banana`

---

### 50. sort filename — Sort lines
Examples:
1) `$ sort data.txt`
   Output (alphabetical).
2) `$ sort -r data.txt`
   Output: reverse order.
3) `$ sort -u data.txt`
   Output: unique sorted.
4) `$ sort -n numbers.txt` (numeric sort)
   For file:
   ```
   10
   2
   30
   ```
   Output:
   ```
   2
   10
   30
   ```

---

### 51. sort > newfile — Save sorted output
Examples:
1) `$ sort data.txt > sorted.txt`
2) `$ sort -u data.txt > unique.txt`
3) `$ sort -nr numbers.txt > top.txt`
4) `$ sort data.txt | uniq > unique_sorted.txt`

---

### 52. uniq -d filename — Show duplicates only
Examples:
1) `$ sort data.txt | uniq -d`
   Output:
   `apple
banana`
2) `$ sort -f data.txt | uniq -di` (case-insensitive)
3) `$ sort data.txt | uniq -dc` (with counts)
   Output:
   `2 apple
2 banana`
4) `$ sort file | uniq -D` (show all duplicates)

---

### 53. sort -n filename — Numeric sort
Examples:
1) `$ sort -n numbers.txt`
2) `$ sort -nr numbers.txt` (reverse numeric)
3) `$ sort -n -k2 scores.txt` (sort by 2nd column numerically)
4) `$ sort -n -t, -k3 file.csv` (comma-separated by 3rd column)

---

## 7) head, tail, and Pipelines

Assume `long.txt` has many lines.

### 54. head filename — First 10 lines
Examples:
1) `$ head long.txt`
2) `$ head -n 5 long.txt`
3) `$ head -c 20 long.txt` (first 20 bytes)
4) `$ head -v long.txt` (show file name)

---

### 55. head -5 filename — First 5 lines
Examples:
1) `$ head -5 long.txt`
2) `$ head -n 1 long.txt` (first line)
3) `$ head -n +20 long.txt` (first 20)
4) `$ head -5 file | wc -l` (count 5)

---

### 56. tail filename — Last 10 lines
Examples:
1) `$ tail long.txt`
2) `$ tail -n 5 long.txt` (last 5)
3) `$ tail -f /var/log/syslog` (follow)
4) `$ tail -c 50 long.txt` (last 50 bytes)

---

### 57. tail -5 filename — Last 5 lines
Examples:
1) `$ tail -5 long.txt`
2) `$ tail -n +100 long.txt` (from line 100 onward)
3) `$ tail -f log.txt | grep -i error` (live errors)
4) `$ tail -5 file | sort`

---

### 58. Combine head, tail, tee
Examples:
1) `$ head -20 long.txt | tail -5`
   Output: Lines 16–20 of file.
2) `$ head -20 long.txt | tail -5 | tee chunk.txt`
   Output: Shows lines and writes to chunk.txt.
3) `$ dmesg | tail -50 | tee last50.log`
4) `$ grep -i error app.log | head -20 | tee errors.txt`

---

## 8) Redirects and xargs

### 59. ls -l > newfilename — Save listing to a file
Examples:
1) `$ ls -l > listing.txt`
2) `$ ls -la >> listing.txt` (append)
3) `$ ls -l *.txt > txt_files.txt`
4) `$ ls /etc 2> errors.txt` (redirect errors)

---

### 60. cat unwanted.txt | xargs rm — Delete listed files
- Be very careful. Always review the list first.
Examples:
1) `$ cat unwanted.txt`
   Output (example):
   ```
   old.log
   temp.tmp
   build/
   ```
   `$ cat unwanted.txt | xargs -d '\n' rm -r`
2) Safer dry-run:
   `$ cat unwanted.txt | xargs -I{} echo rm -r "{}"`
3) Only files:
   `$ grep -v '/$' unwanted.txt | xargs rm`
4) Interactively:
   `$ cat unwanted.txt | xargs -I{} rm -ri "{}"`

---

## 9) Processes and System Load

### 61. ps — Show processes
Examples:
1) `$ ps`
   Output: Your shell + ps.
2) `$ ps -f` (full format)
3) `$ ps -ef` (all processes)
4) `$ ps aux` (BSD style)

---

### 62. kill PID — Kill a process by PID
- Correction: It’s `kill <PID>`, not “kill portnumber”.
- To find process by port:
  - `$ sudo lsof -i :8080` or `$ sudo fuser -v 8080/tcp`
  - then `kill <PID>` or `sudo fuser -k 8080/tcp`

Examples:
1) `$ ps -ef | grep myapp`
   `$ kill 12345`
2) Force kill:
   `$ kill -9 12345`
3) By name:
   `$ pkill myapp`
4) Kill process on port 3000:
   `$ sudo fuser -k 3000/tcp`

---

### 63. ps -f — Full format
Examples:
1) `$ ps -f`
2) `$ ps -f -u omar`
3) `$ ps -fp 1234` (specific PID)
4) `$ ps -fC sshd` (by command name)

---

### 64. ps -ef — All processes, full format
Examples:
1) `$ ps -ef | head`
2) `$ ps -ef | grep nginx`
3) `$ ps -ef --forest` (tree)
4) `$ ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head`

---

### 65. sleep SECONDS — Pause
Examples:
1) `$ sleep 5`
2) `$ echo start; sleep 2; echo end`
3) `$ sleep 0.5` (fractions allowed in bash)
4) `$ (sleep 3; echo done) &` (background)

---

### 66. sleep 120 & ps -f — Background job and list
Examples:
1) `$ sleep 120 &`
   Output: `[1] 23456` (job id and PID)
   `$ ps -f | grep sleep`
2) `$ jobs`
   Output: `[1]+ Running sleep 120 &`
3) `$ fg %1` (bring to foreground)
4) `$ kill %1` or `$ kill 23456`

---

### 67. nohup — Run command immune to hangups
- Example: `nohup mysqldump testdb -u root -p'123' > dump.sql &`
Examples:
1) `$ nohup long_task.sh > out.log 2>&1 &`
   Output: `nohup: ignoring input and appending output to 'nohup.out'` (if not redirected)
2) `$ nohup sleep 300 &`
3) `$ tail -f nohup.out`
4) `$ disown` (detach job from shell)

---

### 68. top — Live process viewer
Examples:
1) `$ top`
2) Help inside top: press `h`; quit with `q`.
3) Sort by memory: press `M`
4) Filter by user: press `u` then type username

Tip: `htop` is a nicer alternative (install separately).

---

### 69. ps aux — All processes (BSD style)
Examples:
1) `$ ps aux | head`
2) `$ ps aux | sort -rk 3 | head` (by CPU)
3) `$ ps aux --sort=-%mem | head`
4) `$ ps aux | grep -i firefox`

---

### 70. jobs — Show background jobs in current shell
Examples:
1) `$ sleep 100 &`
   `$ jobs`
2) `$ jobs -l` (show PIDs)
3) `$ fg %1` (foreground)
4) `$ bg %1` (resume in background)

---

### 71. nice — Set process priority (lower is higher priority)
- Typical range: -20 (highest priority) to 19 (lowest). Use small negative values carefully.
Examples:
1) Start with priority 5:
   `$ nice -n 5 long_task`
2) Slightly higher priority (needs sudo for negative):
   `$ sudo nice -n -1 cpu_task`
3) Change existing process:
   `$ renice 10 -p 12345`
4) Renice by user:
   `$ sudo renice -5 -u omar`

---

## 10) echo and Shell Variables

### 72. echo "text" — Print text
Examples:
1) `$ echo "Hello world"`
   Output: `Hello world`
2) `$ echo Hello World`
   Output: `Hello World`
3) `$ echo "1  2   3"` (preserves spaces inside quotes)
4) `$ echo -n "No newline"`
   Output: `No newline` (no trailing newline)

---

### 73. echo -e — Interpret backslash escapes
Examples:
1) `$ echo -e "A\tB\tC"`
   Output: Tabs between A, B, C
2) `$ echo -e "Line1\nLine2"`
3) `$ echo -e "Bell\a"` (beep if enabled)
4) `$ echo -e "Path: /home/\tuser"`

---

Variables in Bash are dynamically typed (no need for int/float/…).
- Set: `x=10` (no spaces)
- Use: `$x`
- Only use double quotes to interpolate variables. Single quotes won’t expand variables.

### 74. echo $x — Print a variable
Examples:
1) `$ x=10; echo $x`
   Output: `10`
2) `$ greet="good evening"; echo "hi omer $greet"`
   Output: `hi omer good evening`
3) `$ y="A B"; echo $y` vs `echo "$y"`
   Output: Without quotes splits on space; with quotes keeps space.
4) `$ echo "Sum: $((2+3))"`
   Output: `Sum: 5`

Warning: Only double quotes ("") expand variables. Single quotes ('') do not.

---

### 75. echo "$USERNAME" — Current username (env var)
Examples:
1) `$ echo "$USER"`
   Output: `omar`
2) `$ echo "$USERNAME"` (on many systems same as USER)
3) `$ echo "$HOME"`
   Output: `/home/omar`
4) `$ env | grep -E '^(USER|HOME)='`

---

### 76. echo $? — Exit status of previous command
- 0 = success, non-zero = error.
Examples:
1) `$ ls /notfound; echo $?`
   Output:
   `ls: cannot access '/notfound': No such file or directory`
   `2`
2) `$ true; echo $?`
   Output: `0`
3) `$ false; echo $?`
   Output: `1`
4) `$ grep -q "text" file; echo $?`
   Output: 0 if found, 1 if not.

---

### 77. echo $0 — Name of the current shell/script
Examples:
1) `$ echo $0`
   Output: `-bash` (or similar)
2) In a script `test.sh`:
   `echo "Running: $0"`
   Output: `Running: ./test.sh`
3) `$ ps -p $$ -o comm=`
   Output: Your shell name.
4) `$ echo $$` (current shell PID)

---

## 11) Installing Software (Ubuntu/Debian-based)

### 78–79. apt — Package manager
Examples:
1) `$ sudo apt update`
   Output: Updates package lists.
2) `$ sudo apt install htop`
   Output: Installs htop.
3) `$ sudo apt upgrade`
   Output: Upgrades packages.
4) `$ apt show curl` or `$ apt search curl`

---

### 80–82. Download and unzip archives
Examples:
1) `$ wget https://example.com/app.zip`
2) `$ curl -O https://example.com/app.zip` (`-O` writes to file)
3) `$ unzip app.zip`
4) Install a .deb:
   `$ wget https://example.com/app.deb`
   `$ sudo apt install ./app.deb`
   or
   `$ sudo dpkg -i app.deb && sudo apt -f install`

---

## 12) Understanding ls -l Permissions

Example line:
`-rw-r--r-- 1 omar omar 14590 Sep  1 19:44 citys.txt`

- First char: type (`-` file, `d` directory, `l` symlink)
- Next 9 chars: permissions in groups of 3:
  - User/Owner: `rw-` (read/write)
  - Group: `r--` (read)
  - Other: `r--` (read)
- Owner: `omar`, Group: `omar`

Meaning of letters:
- r = read
- w = write
- x = execute (or “search” on directories)
- d = directory
- x on a directory means you can enter it (`cd`), not “execute” it as a program.

---

## 13) Users and /etc/passwd

### 82. List users
- Path is `/etc/passwd` (not `/ect/passwd`)
Examples:
1) `$ cat /etc/passwd | head`
   Output:
   ```
   root:x:0:0:root:/root:/bin/bash
   daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
   ...
   omar:x:1000:1000:,,,:/home/omar:/bin/bash
   ```
2) Fields: name:password(placeholder):UID:GID:gecos:home:shell
3) `$ getent passwd omar`
4) `$ awk -F: '{print $1}' /etc/passwd | sort`

---

### 88. Create a user
- Syntax: `sudo useradd -m -d /home/raju -s /bin/bash raju`
- Then set password: `sudo passwd raju`

Examples:
1) `$ sudo useradd -m -s /bin/bash alice`
2) `$ sudo passwd alice`
3) `$ sudo useradd -m -d /srv/bob -s /bin/bash bob`
4) Add to sudo group:
   `$ sudo usermod -aG sudo alice`

No reboot required typically. For new group membership to take effect, log out and log in again.

---

### 89. Switch user
Examples:
1) `$ su alice`
   Output: Enter alice’s password.
2) `$ sudo su - bob` (if sudoer)
3) `$ su -` (root, if you know root password)
4) `$ cd` after su goes to target user’s home when using `-`.

---

## 14) File Permissions and Ownership

Numeric values:
- r = 4, w = 2, x = 1
- For user/group/other respectively.

Examples of permission triplets:
- rw- (read + write) = 6
- r-- (read only) = 4
- rwx (read + write + execute) = 7
- r-x (read + execute) = 5
- --- (no permissions) = 0

Symbolic who:
- u = user/owner
- g = group
- o = others
- a = all (u+g+o)

### 90. chmod u+rwx filename — Give user rwx
Examples:
1) `$ chmod u+rwx script.sh`
2) `$ chmod g+rx file.txt`
3) `$ chmod o-r file.txt`
4) `$ chmod a+r docs.pdf`

---

### 91. Remove permissions from user
Examples:
1) `$ chmod u-rwx file`
2) `$ chmod u-w file`
3) `$ chmod u-x dir`
4) `$ chmod g-w,o-w file`

---

### 92. Remove all permissions from everyone
Examples:
1) `$ chmod ugo-rwx file`
2) `$ chmod a-rwx file`
3) `$ chmod 000 file`
4) `$ ls -l file` shows `----------`

---

### 93. Give all users read+execute
Examples:
1) `$ chmod a+rx script.sh`
2) `$ chmod 555 read_only_dir` (dirs need x to enter)
3) `$ chmod -R a+rx bin/`
4) `$ chmod g+rx file; chmod o+rx file`

---

### 94. Remove all permissions to all users
- Command given `chmod a+rwx filename` actually adds, not removes.
- To remove all: `chmod a-rwx filename` (see #92)

Examples:
1) `$ chmod a-rwx secret.txt`
2) `$ chmod 000 secret.txt`
3) `$ chmod -R a-rwx private_dir`
4) Restore later: `$ chmod 600 secret.txt`

---

### 95. chmod with numbers
Examples:
1) `$ chmod 777 file` (rwx for all—be careful)
2) `$ chmod 644 file` (common for files)
3) `$ chmod 755 dir` (common for directories)
4) `$ chmod 700 ~/.ssh` (private)

No permissions:
- `$ chmod 000 file`

Special bits (advanced):
- setuid: 4xxx, setgid: 2xxx, sticky: 1xxx
Examples:
- `$ sudo chmod 4755 /usr/bin/somebin` (runs with owner’s UID)
- `$ chmod 2775 shared_dir` (new files inherit group)
- `$ chmod 1777 /shared/tmp` (sticky: only owners can delete their files)

---

### Ownership

96. Delete a user:
- `$ sudo userdel username` (use `-r` to remove home)
Examples:
1) `$ sudo userdel -r alice`
2) `$ sudo userdel bob` (keeps home)
3) `$ sudo deluser alice` (Debian/Ubuntu alternative)
4) Check processes before deletion.

97. Create a group:
- `$ sudo groupadd devs`

Examples:
1) `$ sudo groupadd analytics`
2) `$ getent group analytics`
3) `$ sudo usermod -aG analytics omar`
4) `$ id omar` shows group membership.

98. Delete a group:
- `$ sudo groupdel analytics`

Examples:
1) `$ sudo groupdel tempgroup`
2) `$ getent group tempgroup` (should be gone)
3) Ensure no users rely on it.
4) System groups often managed by packages.

99. Change owner and group:
- `$ sudo chown user:group file`

Examples:
1) `$ sudo chown omar:omar file.txt`
2) `$ sudo chown -R www-data:www-data /var/www/site`
3) `$ sudo chgrp analytics report.csv`
4) After changing groups, you usually don’t need to reboot. If you removed a user from a group: `$ sudo gpasswd -d username groupname` then have the user re-login.

---

## 15) Command Substitution and Variables

100. Use command output as a variable:
- The modern, safer form is `$(...)` instead of backticks.
Examples:
1) `$ listoffiles=$(ls)`
   `$ echo "$listoffiles"`
2) `$ now=$(date +%F-%T); echo "$now"`
3) `$ count=$(ls -1 | wc -l); echo "Files: $count"`
4) `$ first_line=$(head -1 file); echo "$first_line"`

---

## 16) Memory and Disk

101–103. free — Memory usage
Examples:
1) `$ free`
   Output: Memory in KB by default.
2) `$ free -m`
   Output: In MB.
3) `$ free -g`
   Output: In GB.
4) `$ free -h`
   Output: Human-readable.

104. df -h — Disk space (human-readable)
Examples:
1) `$ df -h`
2) `$ df -h /`
3) `$ df -hT` (show filesystem type)
4) `$ df -h --total` (total sum)

105. free -m | grep "Mem"
Examples:
1) `$ free -m | grep "Mem"`
   Output like:
   `Mem:  15943  8123  7820   123   456  6789`
2) `$ free -m | awk '/Mem/{print $2,$3,$4}'` (total used free)
3) `$ free -m | awk '/Mem/{printf "Used: %sMB Free: %sMB\n",$3,$4}'`
4) `$ awk '/Mem/ {print}' /proc/meminfo`

106. AWK example (corrected)
- Your line had typos. A correct way to print the 4th field from free -m’s Mem line:
Examples:
1) `$ free -m | grep "Mem" | awk '{print $4}'`
2) `$ free -m | awk '/Mem/{print $4}'`
3) `$ free -m | awk '/Mem/{printf "Free: %sMB\n",$4}'`
4) Get available memory (more accurate):
   `$ free -m | awk '/Mem/{print $7}'`

---

## 17) Cron Jobs (crontab) — Full Basics

What is cron?
- Cron runs commands on a schedule.
- Each user can have a personal crontab; there’s also system-level cron.

Crontab commands:
- Edit your crontab: `crontab -e` (choose an editor on first use)
- List your crontab: `crontab -l`
- Remove your crontab: `crontab -r` (careful)
- Edit root’s crontab: `sudo crontab -e`
- Edit another user’s crontab: `sudo crontab -e -u username`

Crontab line format:
```
# ┌──────── min (0–59)
# │ ┌────── hour (0–23)
# │ │ ┌──── day of month (1–31)
# │ │ │ ┌── month (1–12 or JAN–DEC)
# │ │ │ │ ┌ day of week (0–7 or SUN–SAT; 0 or 7 = Sunday)
# │ │ │ │ │
# * * * * * command to run
```

Special strings:
- `@reboot` — run once at boot
- `@yearly` or `@annually` — once a year
- `@monthly`, `@weekly`, `@daily`, `@hourly`

Ranges, lists, steps:
- `0-5` (range), `1,2,3` (list), `*/5` (every 5 units)

Environment tips:
- Default PATH is minimal in cron. Use absolute paths (e.g., `/usr/bin/python3`) or set PATH at top of crontab.
- Set SHELL and MAILTO if needed:
  ```
  SHELL=/bin/bash
  PATH=/usr/local/bin:/usr/bin:/bin
  MAILTO=""
  ```

Redirect output:
- Always capture output to a file to debug:
  `... >> /var/log/myjob.log 2>&1`

Examples:
1) Every day at 2:30 AM:
   `30 2 * * * /usr/local/bin/backup.sh >> /var/log/backup.log 2>&1`
2) Every 5 minutes:
   `*/5 * * * * /usr/bin/python3 /home/omar/check.py >> /tmp/check.log 2>&1`
3) Every Monday at 9:00:
   `0 9 * * MON /home/omar/weekly_report.sh`
4) At boot:
   `@reboot /home/omar/startup.sh >> /tmp/startup.log 2>&1`

User-specific:
- Run as root for system tasks: `sudo crontab -e`
- Use `crontab -e -u alice` for alice’s crontab (requires sudo).

System crontab and cron.d:
- `/etc/crontab` has an extra field (the user to run as):
  ```
  # m h dom mon dow user  command
  0 3 * * * root /usr/local/bin/backup.sh
  ```
- Files in `/etc/cron.d/` follow the same format as `/etc/crontab`.
- `/etc/cron.daily`, `/etc/cron.weekly`, etc. run by `crond` or `anacron`.

Anacron (for laptops/offline machines):
- Ensures periodic jobs run if the machine was off at scheduled time.
- Config: `/etc/anacrontab`

Logs and debugging:
- On Ubuntu/Debian, check:
  - `/var/log/syslog` for cron messages: `grep CRON /var/log/syslog`
  - Or `journalctl -u cron` (or `-u crond` on some distros)
- Common pitfalls:
  - Wrong PATH — use absolute paths or set PATH in crontab.
  - No final newline in crontab — add one.
  - Permissions/execute bit missing on scripts — `chmod +x script.sh`.
  - Using `~` home shortcut in cron can fail — use full paths.

Time zones:
- Cron uses system time. If using UTC vs local time, verify with `date` and set if needed.

Testing:
- Run the command manually first.
- Temporarily schedule to run in the next minute for testing.

---

## Bonus: Practical Mini-Workflows

- Find and count error lines in logs:
  ```
  grep -i "error" app.log | wc -l
  ```
- Clean up old logs:
  ```
  find /var/log/myapp -name "*.log" -mtime +7 -print0 | xargs -0 rm -f
  ```
- Save top 20 largest files:
  ```
  du -ah . | sort -hr | head -20 > top20.txt
  ```
- Copy only .conf files:
  ```
  cp /etc/*.conf ~/configs/
  ```

---

## Notes and Corrections for Clarity

- “rmdir -i” is not standard; use `rm -ri` for interactive directory deletion.
- `egrep` and `fgrep` are deprecated aliases; prefer `grep -E` and `grep -F`.
- To kill by “port number,” first find the PID with `lsof -i :PORT` or `fuser 8080/tcp`, then `kill PID`.
- As root, you do not use sudo (you already have full privileges).
- The correct file is `/etc/passwd` (not `/ect/passwd`).
- For grep “start” and “end” of line, use `^pattern` and `pattern$` respectively.
- Use `$(...)` instead of backticks for command substitution.

---
