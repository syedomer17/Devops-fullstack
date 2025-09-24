# AWS EC2 Bootstrap Script Guide

This guide will walk you through launching an AWS EC2 instance and using a bootstrap (user data) script to automatically set up a web server. You’ll also find an explanation of what bootstrap scripts are, step-by-step instructions, and common interview questions with answers.

---

## What is an EC2 Bootstrap Script?

A **bootstrap script** (also known as user data) is a shell script that runs automatically when an EC2 instance is first launched. It’s commonly used to install software, configure services, or set up the environment without needing manual intervention after the instance is running.

---

## Step-by-Step Guide

### 1. Go to EC2 Instances
- Log in to your AWS Management Console.
- Navigate to **EC2** > **Instances**.

### 2. Click on "Launch Instances"
- Click the **Launch Instances** button.

### 3. Add Instance Name
- Under **Name and tags**, enter a name for your instance (e.g., `MyWebServer`).

### 4. Select an AMI and Instance Type
- Choose an Amazon Machine Image (AMI), e.g., Amazon Linux 2 AMI.
- Select your preferred **Instance Type** (e.g., `t2.micro` is free tier eligible).

### 5. Add a Key Pair (Private Key)
- In the **Key pair (login)** section, select an existing key pair or create a new one.
- Download and keep the private key safe—this is needed to SSH into your server.

### 6. Configure Security Group
- Either create a new security group or select an existing one.
- **Add the following inbound rules:**
  - **SSH (port 22)** – for remote terminal access.
  - **HTTP (port 80)** – to allow web traffic.
  - **HTTPS (port 443)** – to allow secure web traffic.

### 7. Add the Bootstrap Script (User Data)
- Scroll down to the **Advanced details** section.
- Find the **User data** field.
- Paste the following script:

    ```bash
    #!/bin/bash

    sudo su

    # Update packages
    yum update -y

    # Install Apache web server
    yum install -y httpd

    # Start Apache
    systemctl start httpd
    systemctl enable httpd

    # Add a test page (optional)
    echo "<h1>Hello from EC2</h1>" > /var/www/html/index.html
    ```

### 8. Launch Your Instance
- Review your settings and click **Launch Instance**.

### 9. Test Your Web Server
- After a few minutes, copy the **Public IPv4 address** of your EC2 instance.
- Visit `http://<your-instance-public-ip>` in your browser.
- You should see:  
  `Hello from EC2`

---

## What Does the Script Do?

- **Updates the package repository** to get the latest versions.
- **Installs Apache (httpd)**, a popular web server.
- **Starts and enables Apache** so it runs on boot.
- **Creates a simple test page** at `/var/www/html/index.html` to confirm the server is working.

---

## Interview Questions & Answers

### Q1: What is EC2 user data used for?
**A:** User data is used to automate the initial setup and configuration of an EC2 instance, such as installing software or configuring the environment, by running a script at first boot.

---

### Q2: Why do we need to open ports 22, 80, and 443 in the security group?
**A:**  
- **22 (SSH):** To remotely access the server terminal.
- **80 (HTTP):** To serve unsecured web traffic.
- **443 (HTTPS):** To serve secured web traffic.

---

### Q3: What happens if you change the user data script after launching the instance?
**A:** By default, the user data script only runs at the first boot. Changing it afterward will not automatically rerun the script unless you manually trigger it or relaunch the instance.

---

### Q4: Why is `systemctl enable httpd` used in the script?
**A:** This command ensures that the Apache web server will automatically start whenever the instance restarts.

---

### Q5: How can you check if your user data script ran successfully?
**A:** You can check the log file at `/var/log/cloud-init-output.log` on your EC2 instance for output and errors related to user data script execution.

---

## References

- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [Amazon EC2 User Data Documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)