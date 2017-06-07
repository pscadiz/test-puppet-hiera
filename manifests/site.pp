hiera_include('classes',[])

node default {}

node 'pao-puppetmaster.buildandrelease.org' {
	class { 'ntp':
		servers => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
	}
}

node 'pao-puppetslave.buildandrelease.org' {
	include ntp
	class { 'profile::release_accounts': 
		ensure => 'absent',
	}
	include ::role::webserver
}

node 'pao-wordpress-1.buildandrelease.org' {
	include role::amp
	include profile::wordpress
}

