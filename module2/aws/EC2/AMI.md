# How to Launch the Same EC2 Instance in Another AWS Region

This guide explains how to move (replicate) your existing EC2 instance from one AWS region (e.g., Mumbai) to another region. You’ll also find commonly asked interview questions and answers on this topic.

---

## Why Would You Want to Do This?
- **Disaster recovery**: Ensure redundancy in different regions.
- **Latency optimization**: Serve users closer to other regions.
- **Migration**: Move workloads to a different AWS region for business needs.

---

## Step-by-Step Guide

### 1. Create an AMI (Amazon Machine Image) of Your EC2 Instance in Mumbai

1. Go to the **EC2 Dashboard** in the Mumbai region.
2. Select your EC2 instance.
3. Click on **Actions** > **Image and templates** > **Create image**.
4. Fill in the image name and description.
5. Click **Create image**.

---

### 2. Copy the AMI to the Target Region

1. Go to **EC2 Dashboard** > **AMIs** in the Mumbai region.
2. Select the AMI you just created.
3. Click on **Actions** > **Copy AMI**.
4. In the dialog, choose the **Destination region** (e.g., US East (N. Virginia), Singapore, etc.).
5. Optionally, update the name and description.
6. Click **Copy AMI**.

---

### 3. Launch a New EC2 Instance from the Copied AMI in the Target Region

1. Switch to the **target AWS region** in the AWS Management Console.
2. Go to **EC2 Dashboard** > **AMIs**.
3. Find the copied AMI (you may need to wait a few minutes for it to appear).
4. Select the AMI and click **Launch instance from AMI**.
5. Configure your instance as desired (instance type, key pair, security group, etc.).
6. Click **Launch Instance**.

---

### 4. (Optional) Update Security Groups, Elastic IP, and Other Settings

- Re-create or update security groups, key pairs, and elastic IPs as needed in the new region.
- Remember: resources like security groups and key pairs are region-specific.

---

## How to Delete an EC2 Instance or AMI

### Delete an EC2 Instance

1. Go to the **EC2 Dashboard** in the AWS Management Console.
2. In the navigation pane, click **Instances**.
3. Select the instance you want to delete (terminate).
4. Click on **Instance state** > **Terminate instance**.
5. Confirm the termination. The instance and its associated resources (except EBS volumes with "Delete on termination" disabled) will be deleted.

### Delete an AMI

1. Go to **EC2 Dashboard** > **AMIs** in the region where your AMI is located.
2. Select the AMI you want to delete.
3. Click **Actions** > **Deregister AMI**.
4. (Optional) To free up storage, delete the associated EBS snapshots:
    - Go to **Snapshots** in the EC2 Dashboard.
    - Find and select the snapshots associated with the deregistered AMI.
    - Click **Actions** > **Delete snapshot**.

---

## Interview Questions & Answers

### Q1: How do you move an EC2 instance from one region to another?
**A:**  
You create an AMI (Amazon Machine Image) of the instance in the source region, copy that AMI to the target region, and launch a new instance from the copied AMI in the new region.

---

### Q2: Can you move an EC2 instance directly between regions?
**A:**  
No, you cannot move an instance directly. You must create an AMI, copy the AMI to the new region, and launch a new instance.

---

### Q3: Do security groups and key pairs move with the AMI?
**A:**  
No. Security groups, key pairs, and Elastic IPs are region-specific. You need to create or select these resources in the target region.

---

### Q4: Will the private IP and public IP remain the same after moving the instance?
**A:**  
No. Both private and public IPs will change when launching the instance in the new region.

---

### Q5: What happens to the data on instance store volumes?
**A:**  
Instance store volumes are ephemeral and do not persist when an AMI is created. Only EBS volumes are included in the AMI.

---

## References

- [Copy an AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html)
- [Launch an instance from an AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html)
- [Terminate Your Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html)
- [Deregister Your AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/deregister-ami.html)
- [Delete EBS Snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html)
