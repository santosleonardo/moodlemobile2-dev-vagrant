# Vagrant Moodle Mobile development environment 

The environment will be a virtualbox machine containing:
* Ubuntu 16.04 LTS
* Node Version Manager (nvm)
* nodejs 6.9.1
* npm
* cordova
* ionic
* bower
* gulp

## Prerequisites
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)
* Git repository URL forked from [official Moodle Mobile App](https://github.com/moodlehq/moodlemobile2.git)

## Usage
Clone or download this repository.  
Edit the FORKED_GIT_REPO variable in the bootstrap.sh file and put your own forked repository to begin development.  
The commands (such as `npm run setup`) must be run inside VM.

### References
* [Setting up your development environment for Moodle Mobile 2](https://docs.moodle.org/dev/Setting_up_your_development_environment_for_Moodle_Mobile_2)