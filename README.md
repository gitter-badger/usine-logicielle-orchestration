# usine-logicielle-orchestration

1- git clone https://github.com/rodesousa/usine-logicielle-orchestration.git

2- cd usine-logicielle-orchestration

3- Dans le fichier hiera.yaml, remplacer "HOSTNAME" par le hostname de la machine

4- puppet module install garethr/docker

5- puppet apply site.pp --modulepath ~/.puppet/modules/ --hiera_config=hiera.yaml
