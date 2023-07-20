# jenkins_on_docker
Example configuration for Jenkins server using docker compose

## Follow the below instructions to setup the Jenkins server

1. Clone the repository.
2. Create a `jenkins_home` directory. :file_folder:
3. Edit the `docker-compose.yml` file to run only one service - jenkins. :teacher:
  - run command `docker compose up -d`
4. Get the Jenkins initial password:
  - from the docker logs: `docker container logs jenkins`
  - from jenkins `secret.key` file :closed_lock_with_key: `cat jenkins_home/secret.key`
5. Set up Your admin user and install Jenkins recommended plugins.
6. Go to jenkins_home and:
  - create ssh-key pair :key:	`ssh-keygen -t ed25519 -f jenkins_agent -P ""`
  - create a .ssh directory :file_folder: `mkdir -p .ssh`
7. Setup an agent node in the Jenkins controller. (repeat step for all your agent services in declared in `docker-compose.yml`) :exclamation:
  - use Launch agents via SSH option
  - copy contents of the jenkins_agent private key :key: and past it into the Jenkins agent You created in the previous step.
`cat jenkins_agent | pbcopy`
8. Pull down the services `docker compose down`
9. Edit the `docker-compose.yml` file to run all of the services. :globe_with_meridians:
  - run command `docker compose up -d`
10. Go to jenkins docker container `docker exec -it jenkins bash` and go inside jenkins_home directory :file_folder: `cd /var/jenkins_home`
11. Exec the host key-scan `ssh-keyscan -H agent >> .ssh/known_hosts`

    Success - Your agents are set up ‼️

### Additional resources
  - Video -> https://youtu.be/ymI02j-hqpU
  - Article -> https://www.cloudbees.com/blog/how-to-install-and-run-jenkins-with-docker-compose

## Setup pipelines
Use the pipelines located in the jenkinsfiles folder :file_folder: to set up Your jobs.

### Additional configuration to support pipelines
JDK -> Manage Jenkins -> Tools

1. JDK set up example using shell script

```
DIR="/home/jenkins/jdks/jdk-16.0.1"
if [-d "$DIR"]; then
 echo "'$DIR' found. Skipping installation."
else
 mkdir -p /home/jenkins/jdks
 cd /home/jenkins/jdks
 wget -c https://download.java.net/java/GA/jdk16.0.1/7147401fd7354114ac51ef3e1328291f/9/GPL/openjdk-16.0.1_linux-aarch64_bin.tar.gz -O - | tar -xz
fi
```
  - Tool home -> `/home/jenkins/jdks/jdk-16.0.1`
  - Label -> agent label(agent on which You want to install the JDK)

2. JDK set up example using Download URL for binary archive
  - Package link -> `https://download.java.net/java/GA/jdk20/bdc68b4b9cbc4ebcb30745c85038d91d/36/GPL/openjdk-20_linux-aarch64_bin.tar.gz`
  - Subdirectory of extracted archive > `jdk-20`
  - Label -> agent label(agent on which You want to install the JDK)
3. Preinstalled java on agent.
  - Set up name and point to the JAVA_HOME environment variable on agent `/usr/lib/jvm/java-17-amazon-corretto`

### Additional plugins to install
1. Slack.
2. Docker pipelines.

 

    



