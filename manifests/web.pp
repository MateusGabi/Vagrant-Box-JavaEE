exec { "apt-update" :
	command => "/usr/bin/apt-get update"
}

package { ["openjdk-8-jre", "tomcat9"]
	ensure => installed,
	require => Exec["apt-update"]
}

service { "tomcat9" :
	ensure => running,
	enable => true,
	hasstatus => true,
	hhasrestart => true,
	require => Package["tomcat9"]
}

file { "/var/lib/tomcat9/webapps/app.war" :
	source => "/vagrant/manifests/app.war",
	owner => tomcat9,
	group => tomcat9,
	mode => 0644,
	require => Package["tomcat9"],
	notify => Service["tomcat9"]
}