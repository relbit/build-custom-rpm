# Evia custom RPM build tree

## Supported software table

Name		| Default version	| Supported versions
--------------- | ---------------	| -----------------------
HAProxy		| 1.5-dev22		| 1.5\*
MongoDB		| 2.4.9			| 2.4.x
PHP		| 5.3.28		| 5.3.25+, 5.4.x, 5.5.x
Ruby		| 2.0.0-p451		| 2.0.0-p\*
Varnish		| 3.0.4			| 3.0.x


## Building guide
### Requirements
- RHEL 6 clone build host dedicated to building + root access
- EPEL repo enabled

## General build guide
1. Pick software you wish to build
2. Check editable parameters by running:
  
  ```bash
  sed -e '/# Makefile/,$d' Makefile
  ```
3. You can build the software using defaults like this:
  
  ```bash
  make
  ```
  Or if you have a multi-processor system, with say 8 cores:
  ```bash
  make -j8
  ```
4. By default you will find the results in [project]/rpms/
5. Copy out the RPMs to your desired location
6. Clean up after yourself
  
  ```bash
  make clean
  ```

## Overriding defaults
You may wish to build a different version from the defaults, or build a newer iteration using higher RPM_RELEASE number. This is done the make way:
```bash
make PARAMETER_YOU_WANT_TO_OVERRIDE=value

# example (bonus: using RPM_DIR does the copying to desired location for you)

cd php/
make -j8 RPM_DIR=/var/www/virtual/repo/php54 RPM_RELEASE=2 PHP_NAME=php54 PHP_VERSION=5.4.25
make clean
```

# License
These files are released under the Apache License 2.0

(c) Relbit, Ltd. 2014
