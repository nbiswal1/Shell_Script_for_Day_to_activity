#! /bin/bash

# Mention the service name
read -p "Enter the Service name : " SERVICE

check_service(){
  if systemctl is-active --quiet "$SERVICE"; then
    echo "The $SERVICE is Running Perfectly"
  else
    echo "The $SERVICE is not Running Perfectly, please take the action"
  fi
}



check_service
