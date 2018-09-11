# Reduced Version of Damn Small Vulnerable Web app

## Overview
This is a small vulnerable application based off https://github.com/stamparm/DSVW, which we modify to expose only the vulnerabilities we want to detect with a cloud ids based on snort. 

We also run CloudLens agent as a sidecar container to tap packets hitting the app.  

## Requirements
  - docker >= 17.12.0-ce  
  - docker-compose >= 1.22.0  

## Quick Start

1. Create a CloudLens project, and get your Project API Key.
2. Place a .env in this directory with your cloudlens project key like shown below.  Change 'CHANGE_TO_YOUR_CLOUDLENS_PROJECT_APIKEY' to your actual Project API Key.

    ```
    CLOUDLENS_PROJECT_API_KEY=CHANGE_TO_YOUR_CLOUDLENS_PROJECT_APIKEY
    ```
    
    Alternatively, you can define this as an environment variable in your shell.
3. Bring up the sample app along with the CloudLens sidecar with the following command.
    
    ```bash
    docker-compose up -d
    ```
    
4. Access the vulnerable app by doing:
    
    ```bash
    curl -i http://localhost:80
    ```
    
    OR
    since the vulnerable app's listening port is mapped to the docker host at port 80, you can open up a browser and see the content at http://YOUR_DOCKER_HOST_IP:80
5. To shutdown:
    
    ```bash
    docker-compose stop
    docker-compose rm
    ```
    
