 #!/bin/bash
 
 # Script name: curr_httpd_summ.sh
 # Description: Summarizes the current Apache httpd log file
 # Author: J Clingensmith    
 # Date: 01/25/2023    
 # Version: 1.0  
                   
 # Location of Apache log file                        
 logfile="/var/log/httpd/access_log"                  
                   
 # create an empty temp file                          
 touch temp.txt        
                   
 # Count the number of occurrences of each HTTP status code
 cat $logfile | awk '{print $9}' | sort | uniq -c >> temp.txt
                   
 # Count the number of occurrences of each IP address 
 cat $logfile | awk '{print $1}' | sort | uniq -c >> temp.txt
                   
 # Count the number of occurrences of each URL
 cat $logfile | awk '{print $7}' | sort | uniq -c >> temp.txt
                   
 # Sort the temp file by count
 sort -nr temp.txt > summary.txt
                   
 # Remove the temp file
 rm temp.txt       
  
 # Print the summary
 cat summary.txt
