# YI Lite Action Camera Firmware Kitchen

This is pre-alpha kitchen for extract Yi lite firmware. Tested on v1.8.26 and lower.

## Dependencies:

Python 2.7 is required.

    $ sudo apt-get install python2.7

python-lzo is the only non-standard module, it may or may not be available for your distro.

    $ sudo apt-get install liblzo2-dev

    If it is available.
    $ sudo apt-get install python-lzo

    Else you will need to install from sources.
    $ git clone https://github.com/jd-boyd/python-lzo.git
    $ cd python-lzo
    $ python setup.py install

Perl is required.

UBI reader is required.

    $ git clone https://github.com/jrspruitt/ubi_reader
    $ cd ubi_reader
    $ sudo python setup.py install

    Or

    $ sudo pip2 install ubi_reader

## Usage:
For basic usage, put firmware '.bin' file to the main folder, rename to 'update_j11.bin' and run extract script. 

    $ git clone https://github.com/aalsmile/yi-lite-firmware-kitchen.git
    $ cd yi-lite-firmware-kitchen
    $ chmod +x extract.sh
    $ sudo ./extract.sh

Run script with sudo because ``ubireader_extract_files`` with option ``-k (keep-permissions)``, requires running as root. See ``ubireader_extract_files --help``.

## Partitions info:

* out1.bin - U-boot config
* out2.bin - U-boot miniuboot
* out3.bin - U-boot uboot
* out4.bin - U-boot linux kernel
* out5.bin - U-boot liteos gzipped kernel
* out6.bin - U-boot picture
* out7.bin - U-boot rootfs
* out8.bin - U-boot home
* out9.bin - U-boot firmware version and sha256 checksum

## Compile firmware:

In near future, while testing is in progress.

### Known Issues

* Tell me.

### TODO

* Compile toolkit.

### CREDITS
* Hisilicon Hi3556V100/Hi3559V100 SDK CN_EN Thanks to 'weweishui' http://bbs.ebaina.com/thread-38214-1-1.html
* UBI reader https://github.com/jrspruitt/ubi_reader
* mtd-utils http://www.linux-mtd.infradead.org/
* Me

