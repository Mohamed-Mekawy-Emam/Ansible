 
#yml syntax check for indentation issues and simple syntax checks
ansible-playbook -i localhost, -c local --syntax-check ~/Ansible/preTasksandPostTasksandRoles/preTasksandPostTasksandRoles.yml

#dry run
ansible-playbook -i localhost, -c local --check ~/Ansible/preTasksandPostTasksandRoles/preTasksandPostTasksandRoles.yml

#to see all changes that will be applied to managed hosts
ansible-playbook -i localhost, -c local --check --diff ~/Ansible/preTasksandPostTasksandRoles/preTasksandPostTasksandRoles.yml
