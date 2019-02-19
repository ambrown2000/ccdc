#!/bin/bash
docker build -t ssh-honeypot .
docker run -d -p 22:22 ssh-honeypot
