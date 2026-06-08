#! /bin/bash

###################################
# Database Backup Script
# Script Name: database_backup.sh
#
# Pre-requisites:
# 1. Install MySQL:
#    sudo apt install mysql-server
#
# 2. Check MySQL status:
#    systemctl status mysql
#
# 3. Set root password (if needed):
#    ALTER USER 'root'@'localhost'
#    IDENTIFIED WITH mysql_native_password BY 'root';
#
# 4. Create database:
#    CREATE DATABASE mydatabase;
# 
# Result:
# Run script: ./database_backup.sh
# Enter password: <Enter password>
# Database backup completed: /root/nagen/Database_Backup/mydatabase_2026-06-08_17-29-55.sql
###################################


# DB Name
DB_NAME="mydatabase"

# Backup Directory
BACKUP_DIR="/root/nagen/Database_Backup"

# Current Date
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the Backup Dir if it doesn't exists.
mkdir -p "$BACKUP_DIR"

# Bazckup File
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${DATE}.sql"

# Taking database backup
mysqldump -u root -p "$DB_NAME" > "$BACKUP_FILE"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup completed: $BACKUP_FILE"
else
    echo "Database backup failed!"
fi
