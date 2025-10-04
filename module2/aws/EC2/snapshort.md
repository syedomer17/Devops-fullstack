# How to Manage EBS Snapshots, AMI Backups, and the Recycle Bin in AWS

This guide covers how to create EBS snapshots (backups), use the Recycle Bin for snapshots and AMIs, copy snapshots across regions/accounts, and delete (clean up) EBS snapshots.

---

## Table of Contents

- [What is an EBS Snapshot?](#what-is-an-ebs-snapshot)
- [Create an EBS Snapshot (Backup)](#create-an-ebs-snapshot-backup)
- [AMI Recycle Bin & Snapshot Recycle Bin](#ami-recycle-bin--snapshot-recycle-bin)
- [Copy Snapshot to Another Region or Account](#copy-snapshot-to-another-region-or-account)
- [Delete (Cleanup) EBS Snapshots](#delete-cleanup-ebs-snapshots)
- [Interview Questions & Answers](#interview-questions--answers)
- [References](#references)

---

## What is an EBS Snapshot?

An EBS snapshot is a point-in-time backup of an EBS volume, stored in Amazon S3. Snapshots are incremental, meaning only changed blocks are saved after the first snapshot.

---

## Create an EBS Snapshot (Backup)

1. Go to the **EC2 Dashboard**.
2. In the left navigation, click **Elastic Block Store > Volumes**.
3. Select the volume you want to back up.
4. Click **Actions** > **Create Snapshot**.
5. Enter a name and description.
6. Click **Create Snapshot**.

**Note:** You can also automate backups using AWS Backup or Data Lifecycle Manager.

---

## AMI Recycle Bin & Snapshot Recycle Bin

### What is the Recycle Bin?

The AWS Recycle Bin allows you to recover accidentally deleted EBS snapshots and AMIs within a retention period that you specify.

### How to Enable the Recycle Bin

1. Go to the **EC2 Dashboard** > **Recycle Bin** (left panel).
2. Click **Create retention rule**.
3. Select **Resource type** (Snapshot or AMI).
4. Define the **Retention period** (e.g., 7 days).
5. (Optional) Apply filters like tags to include/exclude resources.
6. Click **Create retention rule**.

Now, when a snapshot or AMI is deleted, it goes to the Recycle Bin and can be restored within the retention period.

### How to Restore from Recycle Bin

1. Go to **Recycle Bin**.
2. Select the deleted snapshot or AMI.
3. Click **Restore**.

---

## Copy Snapshot to Another Region or Account

### Copy Snapshot Across Regions

1. Go to **EC2 Dashboard** > **Elastic Block Store > Snapshots**.
2. Select the snapshot to copy.
3. Click **Actions** > **Copy Snapshot**.
4. Choose the **Destination region**.
5. (Optional) Enable encryption or select a different KMS key.
6. Click **Copy Snapshot**.
7. Switch to the destination region to use the copied snapshot.

### Copy Snapshot Across AWS Accounts

1. Share the snapshot:
    - Select the snapshot, then **Actions** > **Modify permissions**.
    - Add the AWS Account ID(s) to share with.
2. In the target account, **copy** the shared snapshot to make it private.

---

## Delete (Cleanup) EBS Snapshots

> **Warning:** Deleting a snapshot is irreversible; ensure you no longer need the snapshot or have a backup.

1. Go to **EC2 Dashboard** > **Elastic Block Store > Snapshots**.
2. Select the snapshot(s) to delete.
3. Click **Actions** > **Delete Snapshot**.
4. Confirm the deletion.

If the Recycle Bin is enabled, the snapshot moves there and can be restored within the retention period.

---

## Interview Questions & Answers

### Q1: What is an EBS snapshot, and how does it work?
**A:**  
An EBS snapshot is an incremental, point-in-time backup of an EBS volume stored in S3. Only changed blocks are saved after the initial snapshot.

---

### Q2: How do you copy an EBS snapshot to another region?
**A:**  
Select the snapshot, choose **Copy Snapshot**, pick the destination region, and confirm. The snapshot will appear in the other region when ready.

---

### Q3: What is the AWS Recycle Bin, and why is it useful?
**A:**  
The Recycle Bin allows you to recover deleted snapshots and AMIs within a retention window, protecting against accidental deletion.

---

### Q4: Can you share snapshots across accounts? How?
**A:**  
Yes. Modify snapshot permissions to allow specific AWS Account IDs access. The target account must copy the shared snapshot.

---

### Q5: What happens when you delete a snapshot with Recycle Bin enabled?
**A:**  
The snapshot is moved to the Recycle Bin and can be restored within the retention period. After that, it is permanently deleted.

---

## References

- [EBS Snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html)
- [Copy a Snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html)
- [Share a Snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html)
- [Recycle Bin](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-recycle-bin.html)
- [Delete a Snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html)