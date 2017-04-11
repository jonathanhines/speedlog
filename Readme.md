Internet Speed Logger
====

This is a simple bash script designed to be run from cron so that you can test your internet connection on regular intervals.  The `do_speed_test.sh` script will run `speedtest-cli` and record the current unix time stamp along with the upload and download speeds. It was written when my current and a possible new internet provider offered me a free month of cable and DSL internet with no contracts and free modems.  I proceeded to test both of them for the month and then plotted the results to make a final decision (the test is still running, I'll post the results when I get them. 

Requirements
---

This requires the `speedtest-cli` command line application and was writen for Debian based operating systems.  It will probably work on any linux-based system that you can install speedtest-cli and run bash scripts on.

Installation
---

On Debian based systems (Ubuntu, Debian, Raspian) systems you should be able to issue:

```
sudo apt-get update
sudo apt-get install speedtest-cli
```

Your mileage may vary, this has been tested on Ubuntu 16.04 LTS and Raspian Jessie.

Clone or download this repository and run the `do_speed_test.sh` script.  It should put the raw output of the script in the `latest_test.txt` file and store the results of the test in a file called `speeds.csv`.  You may need to play with file permissions to get everything to work.

Cron
---

To have it run in cron do something like:

```
# Add this line to /etc/crontab, replacing the relevant parts like your user name and the path to the application
# This line runs the speedtest script on the 15th minute of each hour.
15 *    * * *   pi      cd /home/pi/SpeedTest/ && /bin/bash do_speed_test.sh
```
