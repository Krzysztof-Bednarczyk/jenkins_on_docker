#!/bin/bash
cd jenkins_home && \
ssh-keygen -t ed25519 -f jenkins_agent -P "" && \
mkdir -p .ssh