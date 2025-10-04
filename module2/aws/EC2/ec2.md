# AWS EC2 — What it is, how to launch and connect, deploy a static site, and basic interview Q&A

This README explains:
- What Amazon EC2 is (in simple terms)
- Step-by-step: Launch an EC2 instance
- Two ways to connect to your instance (browser and SSH/Git Bash)
- Install Apache (httpd) on Amazon Linux
- Deploy a static website (HTML/CSS/JS) using WinSCP
- Basic EC2 interview questions with concise answers

---

## What is Amazon EC2?

Amazon Elastic Compute Cloud (EC2) is a cloud service that provides resizable virtual servers (called “instances”). You can quickly launch, scale, and pay only for what you use.

Key terms:
- Instance: A virtual machine you run in AWS.
- AMI: Amazon Machine Image, the OS template used to launch instances.
- Instance type: The hardware configuration (CPU, RAM, network) e.g., t2.micro, t3.micro.
- Security Group: A virtual firewall controlling inbound/outbound traffic (e.g., allow SSH/HTTP/HTTPS).
- Key pair: SSH key used to securely connect to Linux instances.
- EBS volume: Persistent block storage attached to your instance.
- Public DNS/IP: Public address to reach your instance from the internet.
- Elastic IP: A static public IPv4 you can attach to an instance.

---

## Prerequisites

- An AWS account with permissions to create EC2 instances.
- A key pair (.pem) to SSH into the instance (create during launch if you don’t have one).
- For SSH on Windows: Install Git Bash.
- For file transfer on Windows: Install WinSCP (or any SFTP client).
- Security Group inbound rules to allow:
  - SSH (22) — ideally from your IP only
  - HTTP (80) — from 0.0.0.0/0
  - HTTPS (443) — from 0.0.0.0/0

---

## Step-by-step: Launch an EC2 Instance

1) Create the instance
- In the AWS Console, go to EC2 > Instances > Launch instances.

2) Name and tags
- Enter a Name for your instance (e.g., “web-server-01”).

3) Choose OS (AMI)
- Select an OS image, e.g., Amazon Linux 2 (free-tier eligible) or Ubuntu.

4) Choose instance type
- Pick an instance type (e.g., t2.micro or t3.micro for free tier).

5) Key pair (login)
- Choose an existing key pair or create a new one. Download and keep your .pem file safe.

6) Network settings (Security Group rules)
- VPC/Subnet: Default is fine for most tests.
- Auto-assign public IP: Enable.
- Security group: Create new or select existing with these inbound rules:
  - SSH, TCP 22, Source: Your IP (recommended)
  - HTTP, TCP 80, Source: 0.0.0.0/0
  - HTTPS, TCP 443, Source: 0.0.0.0/0

7) Storage
- Keep default (e.g., 8–10 GiB gp3) unless you need more.

8) Launch
- Click Launch instance. Wait until the instance state is “Running” and the status checks pass.

---

## Connect to your instance (two ways)

### A) Browser (EC2 Instance Connect)
1) In EC2 > Instances, select the instance checkbox.
2) Click “Connect”.
3) Choose “EC2 Instance Connect”.
4) Click “Connect” to open a browser-based shell.

Notes:
- Your IAM permissions must allow EC2 Instance Connect.
- The instance must be in a public subnet with a reachable public IP/DNS.

### B) SSH from your machine (Git Bash/Terminal)
1) Locate your instance’s Public IPv4 DNS or IP in the console.
2) In your terminal (or Git Bash on Windows), set proper key permissions:
   bash
   chmod 400 /path/to/your-key.pem
   
3) Connect (Amazon Linux):
   bash
   cd downloads (to the that directory where you have install the .ppk file)
   example: ssh -i "MyEc2.pem" ec2-user@ec2-13-203-222-17.ap-south-1.compute.amazonaws.com
   
   For Ubuntu AMIs, use:
   bash
   cd downloads (to the that directory where you have install the .ppk file)
   example: ssh -i "MyEc2.pem" ec2-user@ec2-13-203-222-17.ap-south-1.compute.amazonaws.com
   

Tip: If SSH times out, verify that your Security Group allows port 22 from your IP and the instance has a public IP.

---

## Install Apache (httpd) on Amazon Linux

Run these commands after connecting (Amazon Linux 2):

bash
# Update packages
sudo yum update -y

# Install Apache (httpd)
sudo yum install -y httpd

# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Optional: confirm it’s running
systemctl status httpd

# To add the static webside files
sudo su
chmod 777 /var/www/html


Test in your browser:
- Example: Navigate to http://13.203.222.17
- You should see the Apache test page (or a 403 if directory is empty).

---

## Deploy a static website (HTML/CSS/JS) with WinSCP (Windows)

1) Install WinSCP
- Download and install from the official site.

2) Create a new SFTP session
- File protocol: SFTP
- Host name: Your instance Public DNS (e.g., ec2-xx-xx-xx-xx.compute-1.amazonaws.com)
- Port: 22
- Username: ec2-user (for Amazon Linux), or ubuntu (for Ubuntu)

3) Authentication with your private key
- Click “Advanced…”
- Go to “Authentication” (under SSH).
- Private key: Select your .pem file (WinSCP supports .pem; if prompted, it can convert to .ppk).

4) Connect
- Accept the host key (first-time prompt).

5) Upload website files to Apache’s root
- Apache default web root on Amazon Linux:
  
  /var/www/html
  
- Because /var/www/html is root-owned, you have options:

6) Verify in the browser
-Example: Go to http://13.203.222.17
- Your static site (HTML/CSS/JS) should load.

Tip: To quickly test:
bash
echo "<h1>Hello from EC2</h1>" | sudo tee /var/www/html/index.html


---

## Basic EC2 Interview Questions and Answers

1) What is EC2?
- A web service providing resizable compute capacity (virtual servers) in the AWS cloud.

2) What is an AMI?
- An Amazon Machine Image: a template containing the OS and software to launch instances.

3) What is an instance type?
- A hardware configuration of your instance (CPU, memory, storage, network performance).

4) What are Security Groups?
- Stateful virtual firewalls at the instance level controlling inbound/outbound traffic.

5) Security Group vs. NACL?
- SGs are stateful and attached to ENIs/instances; NACLs are stateless and applied at the subnet level.

6) What is EBS?
- Elastic Block Store: persistent block storage volumes you can attach to instances.

7) EBS vs. Instance Store?
- EBS is persistent across stops/starts; instance store is ephemeral and data is lost when the instance stops/terminates.

8) What is a key pair?
- Public/private key used for SSH authentication into Linux instances (no password login by default).

9) What is an Elastic IP?
- A static public IPv4 you can remap to any instance in the same account/region.

10) How do you connect to an EC2 instance?
- Via EC2 Instance Connect (browser), SSH (Linux/macOS/Windows Git Bash), or Session Manager (with SSM agent/permissions).

11) What is User Data?
- A script that runs at first boot for initial configuration (e.g., installing software).

12) What is an IAM Role for EC2?
- A secure way to grant permissions to your instance without storing static credentials on the VM.

13) How do you scale EC2?
- Use Auto Scaling Groups with scaling policies; integrate with Load Balancers for high availability.

14) What are EC2 Status Checks?
- AWS-level checks for instance/system health; failures indicate hardware or networking issues.

15) How can you make an EC2 instance highly available?
- Use multiple AZs with Auto Scaling and an ELB/ALB; avoid single points of failure.

16) How do you secure SSH access?
- Restrict port 22 to your IP, rotate keys, disable root login, use IAM/SSM Session Manager where possible.

17) What is termination protection?
- A setting that prevents someone from accidentally terminating the instance.

18) How do you persist data across instance restarts?
- Use EBS volumes or external storage (EFS/S3/Databases). Instance store does not persist.

19) What is a Placement Group?
- A strategy for instance placement (Cluster, Spread, Partition) for performance or fault tolerance.

20) How do you reduce EC2 cost?
- Rightsize instances, use Auto Scaling, Spot Instances, Savings Plans/Reserved Instances, and shut down idle resources.

---

## Troubleshooting Tips

- SSH timeouts:
  - Check Security Group inbound rule for SSH (22).
  - Verify the instance has a public IP and the subnet route table has an Internet Gateway.
- Permission denied (SSH):
  - Ensure the correct username (ec2-user for Amazon Linux, ubuntu for Ubuntu).
  - Correct key file and permissions: chmod 400 your-key.pem.
- HTTP not loading:
  - Is httpd running? systemctl status httpd
  - Security Group includes HTTP (80) inbound.
  - Files present in /var/www/html, and index.html exists.
- 403 Forbidden:
  - Check file permissions or SELinux/AppArmor context (if enabled).
  - Ensure Apache has read access to your files.

---

## Security Best Practices

- Limit SSH (22) to your IP only.
- Use IAM Roles instead of embedding credentials.
- Keep OS and packages updated (yum update -y or equivalent).
- Use least privilege for Security Groups and IAM.
- Consider using SSM Session Manager to avoid exposing SSH.
- Enable CloudWatch monitoring and set up alarms/logging.

---

## Quick Command Reference (Amazon Linux 2)

bash
# Connect
ssh -i /path/to/your-key.pem ec2-user@YOUR_PUBLIC_DNS_OR_IP

# Update & Install Apache
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo su
chmod /var/www/html

# Test page
echo "<h1>It works!</h1>" > /var/www/html/index.html


You’re all set to launch, connect, and host a static site on EC2, and you have a quick Q&A to prepare for interviews.