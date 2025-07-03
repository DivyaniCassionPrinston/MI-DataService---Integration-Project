# MI-DataService---Integration-Project
MI DataService - Integration Project

Hi everyone! If you've landed here, chances are you're familiar, at least a little with WSO2 Micro Integrator or Docker. But if you're not, don't worry! This guide will help you grasp the basics as we walk through a simple integration project.
In this project, we'll use:
WSO2 Micro Integrator (WSO2 MI)
Rancher Desktop (with optional WSL support on Windows)
MySQL
Docker

## What is WSO2 Micro Integrator?
WSO2 Micro Integrator (MI) is a lightweight, cloud-native integration engine built for microservices architecture. It enables seamless connectivity between APIs, services, data sources, and systems, whether they are cloud-based, SaaS, or legacy systems.
In simple terms, WSO2 MI helps you:
Integrate different systems (databases, APIs, files, etc.)
Automate data flows and business processes
Deploy integrations easily in cloud-native environments like Docker and Kubernetes etc.

## Project Overview
We'll build a simple RESTful data service that interacts with a MySQL database. The service exposes four endpoints to perform basic CRUD operations on an employee table.
Here's what the project will do: Retrieve all records or a specific employee by ID,  Insert a new employee, Update an existing employee and Remove an existing employee through REST end points. 
By the end of this guide, you will be able to run the Data Service both locally and within a Docker container
Setting the Groundwork

## Setting Up the Containers
Step 1: Prepare the WSO2 MI Server

Download the MI server and Place the exported .CAR file (Carbon Application) into the following directory:
 wso2mi-4.4.0/repository/deployment/server/carbonapps/

Step 2: MySQL Setup

Create a folder called mysql-scripts and Place your SQL script for table creation and data insertion inside it.

Step 3: Docker Compose Configuration

Write a docker-compose.yml to spin up both MySQL and WSO2 MI containers, Ensure proper volume mounting and port mapping
Use a shared network for container communication. Refer the code snippet from the repo. 

## Running the Project
Navigate to the directory where the WSO2 Micro Integrator server and docker-compose.yml file are located. Then, use the docker-compose up command to start the container. Ensure that Rancher Desktop is up and running in the background before executing this command.
Testing endpoints
Once your WSO2 Micro Integrator container is running, you can test the exposed RESTful endpoints using tools like Postman or the command-line tool curl.
