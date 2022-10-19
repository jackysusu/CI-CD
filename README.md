# CI-CD
Nginx Node.js load balance Automated deployment , CI to Jenkins pipeline deploy by Terraform Ansible

Requirments
  vSphere
  vCenter
    make a template
  Gitlab Server
  Workstation
    install tools
      jenkins
      Terraform
      Ansible
  Harbor Server
  
Automated by jenkins pipline  
  Docker
    Build Nginx and Node.js 
    Push images to Harbo
  Terraform
    Create 2 groups server
    1 group include 2 host
  Ansible
    install docker to all host
    pull images from Harbor
    run container 
      2 webserver include nginx node.js
      2 database include mysql 5.7
  
