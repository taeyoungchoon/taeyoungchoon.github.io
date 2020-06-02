(setf network-configuration '(ip nm gw ns ni))

(setf machie-type '(pm vm xm))

(setf dell 'dell)
(setf pm '(dell hp ibm cisco))
(setf vm '(kvm vmware-esxi vmware-workstation virtualbox hyper-v))
(setf xm '(docker))

(setf operating-system-helper '(kubernetes openstack mesos))

(setf apache 'apache2)
(setf httpd '(apache nginx iis))
(setf was '(tomcat wildfly))
(setf database '(mariadb mongo mysql))
(setf directory '(active-directory))

(setf role '(httpd was database directory))

(setf centos 'linux)
(setf operating-system '(centos redhat windows))

(defstruct machine machine-type operating-system role)
(make-machine :machine-type dell :operating-system centos :role apache)


