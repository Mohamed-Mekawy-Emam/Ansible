 
#yml syntax check for indentation issues and simple syntax checks
ansible-playbook -i localhost, -c local --syntax-check /home/memam/Ansible/UsersCreation/preTasksandPostTasksandRoles/preTasksandPostTasksandRoles.yml

#dry run
ansible-playbook -i localhost, -c local --check /home/memam/Ansible/UsersCreation/preTasksandPostTasksandRoles/preTasksandPostTasksandRoles.yml

#to see all changes that will be applied to managed hosts
ansible-playbook -i localhost, -c local --check --diff /home/memam/Ansible/UsersCreation/preTasksandPostTasksandRoles/preTasksandPostTasksandRoles.yml
