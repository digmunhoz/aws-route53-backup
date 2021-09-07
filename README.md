# AWS Route53 Backup

This project was designed to help you to do backup for all route53 hosted zones existing in your aws account.

The goal of this service is to save the hosted zone JSON file in the S3 bucket defined in the `env` file

## Prerequisites

You will need:

* [Docker](https://docs.docker.com/install/)

## Environment Variables
Change file env_example to env and declare all the variables as you need

## Build Container
```shell
docker build -t route53-backup-job .
```

## Run the backup process
```shell
docker run --rm -it --env-file env route53-backup-job
```