To deploy multiple HTML/CSS/JS websites on a single EC2 instance, you have several options depending on your needs and the web server you use (commonly Apache or Nginx). Here’s a simple guide for both:

---

### **Option 1: Using Different Folders (Subdirectories)**
- Upload each website to a different folder inside `/var/www/html` (for Apache) or your web root.
- Example:
  - `/var/www/html/site1`
  - `/var/www/html/site2`
- Users access the sites as:
  - `http://your-ec2-public-dns/site1`
  - `http://your-ec2-public-dns/site2`

#### **Steps**
1. SSH into your EC2 instance.
2. Create directories for each website:
   ```bash
   sudo mkdir /var/www/html/site1
   sudo mkdir /var/www/html/site2
   ```
3. Upload your website files into each folder (using WinSCP, SFTP, or SCP).
4. Access via browser: `http://PUBLIC_DNS/site1/` and `http://PUBLIC_DNS/site2/`

---

### **Option 2: Using Virtual Hosts (Custom Domains)**
- You can configure Apache or Nginx to serve different domains/subdomains from separate folders.
- Users access the sites with different domains, e.g. `site1.example.com`, `site2.example.com`.

#### **Apache Example**
1. Create folders for each site:
   ```bash
   sudo mkdir /var/www/site1
   sudo mkdir /var/www/site2
   ```
2. Upload website files into each folder.
3. Create virtual host config files (e.g., `/etc/httpd/conf.d/site1.conf`):
   ```
   <VirtualHost *:80>
       ServerName site1.example.com
       DocumentRoot /var/www/site1
   </VirtualHost>
   ```
   Repeat for site2.
4. Restart Apache:
   ```bash
   sudo systemctl restart httpd
   ```
5. Set up DNS records so that your domains point to the EC2 public IP.

---

### **Option 3: Using Different Ports**
- Run each site on a different port (e.g., 8081, 8082), but this is less common for public sites.

---

### **Summary Table**

| Method                   | How to Access                                 | Pros                   | Cons             |
|--------------------------|-----------------------------------------------|------------------------|------------------|
| Subdirectories           | `http://dns/site1`, `http://dns/site2`        | Simple, no config      | URLs not separate|
| Virtual Hosts (domains)  | `http://site1.example.com`                    | Professional, custom   | DNS/config needed|
| Different Ports          | `http://dns:8081`, `http://dns:8082`          | Quick test/dev         | Not user-friendly|

---

### **Best for Beginners:**
Use different folders inside `/var/www/html` and access via subdirectory URLs.

---
