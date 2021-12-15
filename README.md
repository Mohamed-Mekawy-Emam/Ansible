# Ansible
Ansible Foundation and Ansible Advanced 

**Ansible IN a Nutshell** 
=====================
1-It all starts with a PLAYBOOK, which is a .yaml or a .yml formatted file this play book consists of a one or more PLAYS.

2-Each PLAY runs in a set of TARGET HOSTS so each play shall start with - hosts: at the beginning followed by PLAY NAME - name: 

3-Each PLAY consists of a one or more TASKS, BLOCK of tasks with RESCUE and ALWAYS [like try-catch-finally block in java] or ROLES with a pre-defined standardized hierarchy at minimum a /tasks with main.yml file describes role functionality

4-Each TASK may start with a TASK NAME - name: for readability followed by a MODULE shall run and may be combining LOOPS and CONDITIONS or NOTIFIED by a HANDLERS incase of failure.

5-The most important thing is you need to take care of indentation as ansible yaml files are sensitive to spaces :-) as Python in its core implementation. 
