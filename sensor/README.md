# A logical IDS app composed of Snort, Cloudlens and Filebeat

## Overview
This is a minimal phusion/baseimage with snort installed, with custom rules and output plugin configured for alerting to a csv file which binds to a volume.  The main app container is sample_snort.  CloudLens sidecar container is used to set up the aggregation interface named cloudlens0 that Snort will listen on.  The Filebeat sidecar monitors content changes in the csv file written to by Snort in the volume, and ship it off to Logstash.

## Requirements
  - docker >= 17.12.0-ce
  - docker-compose >= 1.22.0

you should have your ELK container running.

## Quick Start
1. Place a .env in this directory with your cloudlens project key and ELK/Logstash hostname or IP.

    ```bash
    CLOUDLENS_PROJECT_API_KEY=CHANGE_TO_YOUR_CLOUDLENS_PROJECT_APIKEY
    ELK_HOSTNAME_OR_IP=CHANGE_TO_YOUR_ELK_LOGSTASH_DOMAIN_OR_IP
    ```  
    Alternatively, you can define this as environment variables in your shell.
2. Bring up the logical IDS sensor app, comprised of Snort, CloudLens and Filebeat.
    ```bash
    docker-compose up -d
    ```

3. The alerts will be output to /var/log/snort/alert.csv in the snort container. Each entry in the csv is an alert detected by snort.  The fields of most interest are: timestamp, sig_id (signature id for the alert), sig_rev (signature revision), msg (human readable msg from the alert), proto, src, srcport, dst, dstport

    Below is all the fields of an entry in the csv output with default formatting.  
    ```
     * timestamp
     * sig_generator
     * sig_id
     * sig_rev
     * msg
     * proto
     * src
     * srcport
     * dst
     * dstport
     * ethsrc
     * ethdst
     * ethlen
     * tcpflags
     * tcpseq
     * tcpack
     * tcplen
     * tcpwindow
     * ttl
     * tos
     * id
     * dgmlen
     * iplen
     * icmptype
     * icmpcode
     * icmpid
     * icmpseq
    ```
4. To shutdown:  
    
    ```bash
    docker-compose rm -f -s
    ```

5. To remove the volume shared between Snort and Filebeat (since docker-compose doesn't nuke it)  
   
    ```bash
    docker volume rm snort_logs 
    ```