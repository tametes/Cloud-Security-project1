# Cloud-Security

This is an ELK monitoring stack within your virtual networks. This will allow us to monitor the performance of their Web server that is running DVWA. In particular, the ELK stack allows analysts to: Easily collect logs from multiple machines into a single database. Quickly execute complex searches, such as: Find the 12 internal IP addresses that sent the most HTTP traffic to my gateway between 4 a.m. and 8 a.m. in April 2020. Build graphs, charts, and other visualizations from network data. It is a fully functional monitoring solution that lives on the cloud.

Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below.

(Diagrams/NetworkDiagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook___ file may be used to install only certain pieces of it, such as Filebeat.

(Ansible/filebeat-playbook.yml)

This document contains the following details:

Description of the Topologu
Access Policies
ELK Configuration
Beats in Use
Machines Being Monitored
How to Use the Ansible Build
Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly secured and available_, in addition to restricting access___ to the network.

What aspect of security do load balancers protect? What is the advantage of a jump box?_

Load Balancing plays an important security role as computing moves evermore to the cloud. The off-loading function of a load balancer defends an organization against distributed denial-of-service (DDoS) attacks. It does this by shifting attack traffic from the corporate server to a public cloud provider. is the process of distributing workloads across multiple servers, collectively known as a server cluster. The main purpose of load balancing is to prevent any single server from getting overloaded and possibly breaking down.

A jump box is a secure computer that all admins first connect to before launching any administrative task or use as an organization point to connect to other servers or untrusted environments. It is an intermediary host or an SSH gateway to a remote network, through which a connection can be made to another host in a dissimilar security zone, for example a demilitarized zone (DMZ). It bridges two dissimilar security zones and offers controlled access between them

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the the logs_ and system traffic_.

What does Filebeat watch for? _Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash. Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as: Apache

What does Metricbeat record? _Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

The configuration details of each machine may be found below. Note: Use the Markdown Table Generator to add/remove values from the table.

Name	Function	IP Address	Operating System
Jump Box	Ansible	10.2.0.4	Linux
Web-1	DVWA	10.0.0.5	Linux
Web-2	DVWA	10.0.0.6	Linux
Web-3	EuxLK	10.0.0.7	Lin
Access Policies
The machines on the internal network are not exposed to the public Internet.

Only the Jump Box_ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: Add whitelisted IP addresses_162.231.160.216

Machines within the network can only be accessed by Jump Box___. Which machine did you allow to access your ELK VM? What was its IP address?_ The jump box is allowed to acces the ELK vm. Its IP address is 10.1.0.4 and the local machine. The IP address is 162.231.160.216 A summary of the access policies in place can be found in the table below.

Name	Publicly Accessible	Allowed IP Addresses
Jump Box	Yes	10.1.0.5 10.1.0.6
                  10.1.0.9          |
| Elk-VM | Yes | 10.2.0.4 | | | | |

Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

What is the main advantage of automating configuration with Ansible? _The primary benefit of Ansible is it allows IT administrators to automate away the drudgery from their daily tasks. That frees them to focus on efforts that help deliver more value to the business by spending time on more important tasks
The playbook implements the following tasks:

... Install Python3-pip
...Install Docker using pip
...Install ELK
...Enable docker service on restart
The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.

(Absible/docker_ps.png)======

Target Machines & Beats
This ELK server is configured to monitor the following machines:

_TODO: List the IP addresses of the machines you are monitoring_10.1.0.5 10.1.0.6 10.1.0.9
We have installed the following Beats on these machines:

We successfully installed_filebeat and metricbeat.
These Beats allow us to collect the following information from each machine:

-Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

-Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

Copy the Playbook.yml_ file to the anisble container_in the Jump Box_.
Update the the ansible.cfg_ file to include the IPs of the three machines (Web-1 10.1.0.5, Web_2 10.1.0.6, and Web_3 10.1.0.9)
Run the playbook, and navigate to _the ansible container and http://52.183.31.107:5601/app/kibana to check that the installation worked as expected.
Answer the following questions to fill in the blanks:_

_Which file is the playbook? Where do you copy it? We have filebeat and metricbeat playbooks which are copied in the abisble container
_Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_By adding the ELK's IP to the ansible.cfg file
_Which URL do you navigate to in order to check that the ELK server is running? http://52.183.31.107:5601/app/kibana
