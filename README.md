# Sample Cloud IDS

This repository holds the source code you need to bring up a setup locally on a Docker host, which mirrors the example described in part 3 of the Cloud IDS blog series.

![sample scenario][sample scenario]

## Repository layout

  - app: contains docker compose definition to bring up the app and CloudLens to monitor packets
  - sensor: contains docker compose definition to bring up the logical ids sensor application consisting of Snort, CloudLens agent and Filebeat.
  - events_ui: contains docker compose definition to bring up ELK to serve event aggregation and end user presentation.

## Requirements
  - docker engine (>=17.12.0-ce): see [install instructions][docker setup] 
  - docker compose (>= 1.22.0): see [install instructions][docker compose setup]

## Quick start instructions
  1. set up [cloudlens account][cloudlens account], create project and obtain project key 
  2. go into events_ui directory, follow the instructions there to start ELK.
  3. with the ELK hostname/IP from (2) and cloudlens project key: go into sensor directory, follow the instructions there to start Snort sensor
  4. with the cloudlens project key: go into app directory, follow the instructions there to start the vulnerable app.
  5. create the vulnerable app and the snort sensor groups in CloudLens, and connect them.
  6. analyze via Kibana.
  
[docker setup]: https://docs.docker.com/install/ "docker ce setup"
[docker compose setup]: https://docs.docker.com/compose/install/#install-compose "docker compose install setup"
[cloudlens account]: https://ixia.cloud/startup
[sample scenario]: https://gist.githubusercontent.com/winstonliu-keysight/61dbb809da0e5dd40fcccab4848314c1/raw/61cbf5ac6cc6c431ef007db7694691e4a525dfe0/sample_cloud_ids_scenario.png