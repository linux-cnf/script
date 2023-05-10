#!./bin/bash
#purpose: how to check security update in centos 7 without yum when server has no internet 
#author: bablish jaiswal
#contact: linux.cnf@gmail.com
log_file="/var/log/vulnerabilities.log"

# Use the rpm command to list all installed packages that have security updates available
security_updates=$(rpm -qa --qf '%{NAME}\n' | xargs rpm -q --changelog | grep -i "security" | awk '{print $1}' | sort -u)

# Check if any security updates are available
if [[ "$security_updates" == "" ]]; then
  echo "No security updates available"
else
  # Write the list of security updates to the log file
  echo "Security updates available:" > "$log_file"
  echo "$security_updates" >> "$log_file"

  # Display a warning message
  echo "Warning: Security updates available. Check $log_file for details."
fi
