```
build-custom-rpm/hhvm (r2dev)$ make help
/home/snajpa/tmp/build-custom-rpm/hhvm/../.make/Makefile.includes:48: 
/home/snajpa/tmp/build-custom-rpm/hhvm/../.make/Makefile.includes:54: RPM_DISTRIBUTION not set in Makefile.settings, defaulting to Fedora release 20 (Heisenbug)
Evia RPM Build Root
	Name:		hhvm
	Summary:	HipHop VM (HHVM) is a virtual machine for executing programs written in PHP
	
Package options
	[VERBOSE=1]	Verbose operation
	
Package make targets
	all		Alias to build
	prereq		Install prerequisites from system repos
	build		Build package
	install		Install package(s)
	uninstall	Uninstall package(s), asks interactively
	clean		Clean the build root of this package
	getver	Get package version	help
	
Resulting RPM files will be found in:
	/root/rpmbuild//RPMS
```
```
$ make list
bird                                1.4.0
bitaccount                          2.2.0
bitadmin                            2.2.0
bitadmin-plugin-superfaktura        2.2.0
bitcron                             2.2.0
bitctl                              2.2.3
bitdeploy                           2.2.0
bitfront                            2.2.0
bitinstall                          2.2.0
bitlog                              2.2.0
bitmailer                           2.2.0
bitmodels                           2.2.1
bitstat                             2.2.0
bitsuper                            2.2.2
boost                              1.55.0
evia-release                        2.2.0
evia-template-bitoxy                2.1.0
evia-template-ens                   2.1.0
evia-template-gal                   2.1.0
evia-template-generic               2.1.0
evia-template-ha                    2.1.0
evia-template-han                   2.1.0
evia-template-ins                   2.1.0
evia-template-mail                  2.1.0
evia-template-mem                   2.1.0
evia-template-mon                   2.1.0
evia-template-my                    2.1.0
evia-template-nat                   2.1.0
evia-template-nfs                   2.1.0
evia-template-ngx                   2.1.0
evia-template-pma                   2.1.0
evia-template-relay                 2.1.0
evia-template-uv                    2.1.0
evia-template-vns                   2.1.0
evia-template-w                     2.1.0
haproxy                             1.5.4
hhvm                                  3.3
httpd22                            2.2.29
httpd22-apr                        1.3.12
httpd22-apr-util                   1.3.12
httpd22-mod_fastcgi                 2.4.7
ImageMagick                         6.8.9
libglog                             0.3.3
libmemcached                       1.0.18
libmhash                          0.9.9.9
mongodb                                  
nginx                               1.6.2
php                                5.3.29
php-extra-ioncube                   4.6.1
phpMyAdmin                          4.2.9
php-pecl-APC                       3.1.13
php-pecl-APCu                       4.0.6
php-pecl-geoip                      1.0.8
php-pecl-igbinary                   1.1.1
php-pecl-imagick                    3.1.2
php-pecl-memcache                   3.0.8
php-pecl-memcached                  2.2.0
php-pecl-mongo                      1.4.5
php-pecl-redis                      2.2.5
php-pecl-turbo_realpath               1.3
php-pecl-ZendOpcache                7.0.3
re2c                             0.13.7.5
roundcubemail                       1.0.1
ruby                                2.1.2
sqlite                              3.8.5
tbb                                   4.2
varnish                             3.0.4
virtual-php                             1
virtual-php53                           1
virtual-php54                           1
virtual-php55                           1
virtual-php56                           1
```
