Two playbooks (and one configuration file) to rule them all ;-)

# deploy-undercloud.yaml
This playbook deploys and configures undercloud node. Please check _config.yaml.example_ file for available configuration options.
If you want to install Ansible and upload these playbooks to the undercloud node automagically, please set _goAnsible_ run variable to true.

### Example:
```bash
ansible-playbook -i inventory/undercloud deploy-undercloud.yaml -e "goAnsible=true"
```

# configure-overcloud.yaml
This playbook configures additional services on the overcloud nodes.
By default it doesn't register overcloud nodes with RHN. Therefore services which need extra packages installed won't work:
1. FWaaS requires
  * openstack-neutron-fwaas
  * python-neutron-fwaas
 

## Currently the following services can be configured with configure-overcloud.yaml playbook:

1. LBaaSv1
Needs _lbaasv1_ run variable set to true.

2. FWaaS
Needs _fwaas_ run variable set to true.

### Example:
```bash
ansible-playbook -i inventory/openstack.py configure-overcloud.yaml -e "rhnreg=true lbaasv1=true fwaas=true"
```
