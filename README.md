Two playbooks (and one configuration file) to rule them all ;-)

*deploy-undercloud.yaml
This playbook deploys and configures undercloud node. Please check config.yaml.example file for available configuration options.

Example:
ansible-playbook -i inventory/undercloud deploy-undercloud.yaml


*configure-overcloud.yaml
This playbook configures additional services on the overcloud nodes.
By default it doesn't register overcloud nodes with RHN. Therefore services which need extra packages installed won't work:
- FWaaS requires
    - openstack-neutron-fwaas
    - python-neutron-fwaas
 


Currently the following services can be configured with configure-overcloud.yaml playbook:

LBaaSv1:
Needs lbaasv1 run variable set to true.

FWaaS
Needs fwaas run variable set to true.

Example:
ansible-playbook -i inventory/openstack.py configure-overcloud.yaml -e "rhnreg=true lbaasv1=true fwaas=true"

