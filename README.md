# Cloud-Security

This is an ELK monitoring stack within your virtual networks. This will allow us to monitor the performance of their Web server that is running DVWA. In particular, the ELK stack allows analysts to: Easily collect logs from multiple machines into a single database. Quickly execute complex searches, such as: Find the 12 internal IP addresses that sent the most HTTP traffic to my gateway between 4 a.m. and 8 a.m. in April 2020. Build graphs, charts, and other visualizations from network data. It is a fully functional monitoring solution that lives on the cloud.

## Automated ELK Stack Deployment
The configuration details of each machine may be found below.




Name	    Function	    IP Address	Operating System
Jump Box	 Gateway	    10.0.0.4	Linux
DVWA 1	  Web Server  	10.0.0.5	Linux
DVWA 2	 Web Server	    10.0.0.6	Linux
ELK	   Monitoring	      10.2.0.4	Linux






In addition to the above, Azure has provisioned a load balancer in front of all machines except for the jump box. The load balancer's targets are organized into the following availability zones:
•	Availability Zone 1: DVWA 1 + DVWA 2
•	Availability Zone 2: ELK
ELK Server Configuration
The ELK VM exposes an Elastic Stack instance. Docker is used to download and manage an ELK container.
Rather than configure ELK manually, we opted to develop a reusable Ansible Playbook to accomplish the task. This playbook is duplicated below.
To use this playbook, one must log into the Jump Box, then issue: ansible-playbook install_elk.yml elk. This runs the install_elk.yml playbook on the elk host.
Access Policies
The machines on the internal network are not exposed to the public Internet.
Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the IP address 64.72.118.76
•	Note: Your answer will be different! 
Machines within the network can only be accessed by each other. The DVWA 1 and DVWA 2 VMs send traffic to the ELK server.
A summary of the access policies in place can be found in the table below.



Name	   Publicly Accessible	   Allowed IP Addresses
Jump Box      yes                52.152.231.136
ELK           No	               10.0.0.1-254
DVWA 1  	    No                 10.0.0.1-254
DVWA 2      	No	               10.0.0.1-254





Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
•	TODO: What is the main advantage of automating configuration with Ansible?
The playbook implements the following tasks


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- What is the main advantage of automating configuration with Ansible?
_The primary benefit of Ansible is it allows IT administrators to automate away the drudgery from their daily tasks. That frees them to focus on efforts that help deliver more value to the business by spending time on more important tasks

The playbook implements the following tasks:

- ... Install Python3-pip
- ...Install Docker using pip
- ...Install ELK
- ...Enable docker service on restart

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Absible/docker_ps.png)======

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_10.0.0.5 10.0.0.6 10.0.0.7

We have installed the following Beats on these machines:
- We successfully installed_filebeat and metricbeat.

These Beats allow us to collect the following information from each machine:


-Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

-Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the __Playbook.yml___ file to _the anisble container_in the Jump Box__.
- Update the __the ansible.cfg___ file to include the IPs of the three machines (Web-1 10.0.0.5, Web_2 10.0.0.6, and Web_3 10.0.0.7)
- Run the playbook, and navigate to _the ansible container and http://13.77.156.70:5601/app/kibana to check that the installation worked as expected.

 Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?
We have filebeat and metricbeat playbooks which are copied in the abisble container
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_By adding the ELK's IP to the ansible.cfg file
- _Which URL do you navigate to in order to check that the ELK server is running?
http://13.77.156.70:5601/app/kibana 
