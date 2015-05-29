node 'rds-pr601-vr603.wemanity.lan'{
	
	service { 'docker':
		enable      => true,
		ensure      => running,
	}

	docker::run { 'postgresql':
  		image	=> 'sameersbn/postgresql:9.4',
  		env		=> [hiera('db_user'),hiera('db_pass'),hiera('db_name')],
#  		require	=> Service['docker']
	}

	docker::run { 'redis':
  		image	=> 'sameersbn/redis:latest',
#  		require	=> Service['docker']
	}

	docker::run { 'gitlab':
  		image	=> 'rodesousa/usine-logicielle-gitlab',
  		ports	=> ['10080:80','10022:22'],
  		depends => ['postgresql','redis'],
 # 		require	=> Service['docker']
	}

	docker::run { 'nexus':
  		image	=> 'rodesousa/usine-logicielle-nexus',
  		ports	=> '18081:8081',
  #		require	=> Service['docker']
	}

	docker::run { 'jenkins':
  		image	=> 'rodesousa/usine-logicielle-jenkins',
  		ports	=> ['18080:8080','10023:22'],
  		volumes	=> '/opt/source/',
  		depends => ['nexus','gitlab'],
  #		require	=> Service['docker']
	}

	docker::run { 'elk':
  		image	=> 'rodesousa/usine-logicielle-elk',
  		ports	=> ['15000:5000','15601:5601','19200:9200'],
  #		require	=> Service['docker']
	}	
}