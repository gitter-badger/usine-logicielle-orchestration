# usine-logicielle-orchestration

1- git clone https://github.com/rodesousa/usine-logicielle-orchestration.git

2- cd usine-logicielle-orchestration

3- puppet module install garethr/docker

4- puppet apply site.pp --modulepath ~/.puppet/modules/ --hiera_config=hiera.yaml
