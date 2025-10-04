# How to Manage Elastic IP (EIP) in AWS

This guide explains how to allocate an Elastic IP (EIP), associate it with an EC2 instance, disassociate it, and finally delete (release) the Elastic IP. You’ll also find commonly asked interview questions and answers on this topic.

---

## What is an Elastic IP?

An Elastic IP (EIP) is a static, public IPv4 address designed for dynamic cloud computing. You can allocate an Elastic IP to your AWS account and then associate it with any EC2 instance in your account within a specific region.

---

## Step-by-Step Guide

### 1. Allocate a New Elastic IP

1. Go to the **EC2 Dashboard** in the AWS Management Console.
2. In the left navigation pane, click on **Elastic IPs**.
3. Click **Allocate Elastic IP address**.
4. Optionally, select a network border group (for advanced use cases).
5. Click **Allocate**.
6. You will see your newly allocated Elastic IP in the list.

---

### 2. Associate Elastic IP with an EC2 Instance

1. In the **Elastic IPs** section, select the EIP you want to associate.
2. Click **Actions** > **Associate Elastic IP address**.
3. In the dialog, select:
   - **Instance**: Choose the EC2 instance you want to associate.
   - **Private IP address**: (Optional) Select a specific private IP if the instance has multiple.
4. Click **Associate**.

---

### 3. Disassociate Elastic IP from an EC2 Instance

1. In the **Elastic IPs** section, select the EIP that is currently associated.
2. Click **Actions** > **Disassociate Elastic IP address**.
3. Confirm by clicking **Disassociate**.

---

### 4. Release (Delete) an Elastic IP

> **Warning**: Only release an EIP if you no longer need it. Once released, you might not get the same IP again.

1. In the **Elastic IPs** section, select the EIP you want to delete.
2. Click **Actions** > **Release Elastic IP address**.
3. Confirm by clicking **Release**.

---

## Interview Questions & Answers

### Q1: What is an Elastic IP and why would you use it?
**A:**  
An Elastic IP is a static, public IPv4 address for AWS resources, mainly EC2 instances. It allows you to mask the failure of an instance by rapidly remapping the address to another instance.

---

### Q2: Can you associate an Elastic IP with multiple instances at once?
**A:**  
No, an Elastic IP can only be associated with one resource (e.g., one instance or one network interface) at a time.

---

### Q3: Do you pay for an Elastic IP?
**A:**  
Elastic IPs are free as long as they are associated with a running instance. You are charged for unused (unassociated) Elastic IPs.

---

### Q4: What happens if you release an Elastic IP?
**A:**  
Once released, the Elastic IP is returned to AWS’s pool and may be allocated to another user. You may not get the same IP again if you request a new one.

---

### Q5: How do you move an Elastic IP to another EC2 instance?
**A:**  
Disassociate the EIP from the current instance, and then associate it with the new instance.

---

## References

- [Elastic IP Addresses in Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
- [Associate an Elastic IP address with an instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html#using-instance-addressing-eip-associate)
- [Disassociate and Release an Elastic IP address](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html#eip-release)