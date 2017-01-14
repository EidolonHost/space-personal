# Space - Personal

Space is a simple virtualization control panel written in Python with Flask. Space utilizes the libvirt API to interact directly with the hypervisor, and thus (will eventually) support all virtualization technology that libvirt supports.

This project is still in a relatively early stage of development, it is feature complete but there is still a fair amount of work to be done. With that being said, use at your own risk! 

The project's official website is: [https://spacepanel.io](https://spacepanel.io) 

## Update
The site no longer has any sort of link to the Open Source version. The repository for SpacePanel has since then been deleted. There are several forks that exist and none of them have had code pushed, including this repository as of this commit.

## Update 1.2
I have begun to work on this project, myself. I'm currently updating bits and pieces of Space-Personal and working on getting it into a more usable state... so bear with me while I work on do that. At the same time, though, I want to note that I'm learning how Python works.

So... yes, that means I'm completely unfamiliar with how Python works in general. But I will be using lots of tools to help me with testing and making sure I release at least moderately functional code that won't blow up... and hopefully, not create any exploit holes.

However, if you _do_ find one, please let me know immediately, along with a patch by way of messaging me through GitHub. I **will** act on a security issue that's been reported.

---

## Current Version - 0.1.3

This update added the following:

* Debian/Ubuntu support - This is still sort of preliminary, but everything _appears_ to be working, please let us know if you find that it is not.
* Added the ability to set a local virtual machine to boot from the CD (ISO) or the HDD.
* Fixed numerous UI bux
* Fixed behavior issues with Linodes/Droplets
* Improved error pages

## Please Note:

There were some endpoints that were not checking for login previously (before b2e1366d4b3f2b5b057d8d6bb20118538dea658e). If you have a version from before that commit installed, please update!

---

## Help Support SpacePanel

Please consider contributing code and other such things to this project!

---

## Requirements

* Processor / virtual processor that supports hardware virtualization
* Centos 6 / Debian 7 / Ubuntu 14.04
* Python2
* MongoDB
* KVM (currently only support virtualization technology)
* RabbitMQ (used by Celery)
* Variety of python packages shown [here](https://github.com/EidolonHost/space-personal/blob/master/requirements.txt)

---

## Supported Providers

In the most recent release support for off-site virtual machines was added. Space currently supports the following Cloud/VPS providers:

* [DigitalOcean](https://www.digitalocean.com/)
* [Linode](https://www.linode.com)

This section will be updated as support for more providers is added. If you have a specific provider you would like to see, please let me know. 

---

## Installation

1. Install git client `yum install git` for CentOS `apt-get install git` for Debian/Ubuntu. 
2. `mkdir /srv/space && cd /srv/space && git clone https://github.com/EidolonHost/space-personal.git .`
3. Configure `virbr0` as a bridge interface, [this](http://www.linux-kvm.org/page/Networking) may be useful in accomplishing this.
4. `./scripts/setup.sh` - This will install all dependencies, start necessary services and start Space.
5. Navigate to `your.ip.address.here:10051/setup` to complete the setup process.
6. Make the directories for your disks, images and configs, by default these are `/var/disks`, `/var/images`, `/var/configs`. Make them with `mkdir /var/disks /var/images /var/configs` if you are using the defaults. 
7. Add an image to the `/var/images` directory, you can use wget to do that. 
8. Login via `your.ip.address.here:10051/login`
9. Go to `Networking` and add an IP range. 
10. Go to `your.ip.address.here:10051/utils/import_images` to import your new image.
11. (Optional) If you are looking to use Linode/DigitalOcean, go to `/settings` and input your API key for each/either service.
12. Make your first virtual machine and enjoy!

---

## Troubleshooting

1.Celery didn't start

 This is a known issue, you may need to run `export C_FORCE_ROOT="true"` as root before Celery will start. You can manually start Celery if it fails using `./srv/space/celery`.

2.I see command `gunicorn was not found`

 This means pip failed to install stuff, first make sure the `pip` command works. If it doesn't, install python-pip using yum `yum install python-pip` or easy_install `easy_install pip`. After pip is installed, install the requirements `pip -r /srv/space/requirements.txt`.

3.Experiencing general weirdness, things not installing, etc.

 Other strangeness is usually attributed to not running Space as `root`, make sure you are using the root user when installing Space, starting/stopping space, etc.

4.DHCPD failed to start

 This is expected (sort of). You should see DHCPD start normally after you add an IP range. If that doesn't happen, `dnsmasq` is likely running on that port. Kill it with `pkill dnsmasq` and then try `service dhcpd start`.

5.I'm seeing errors when I try to make a Linode/Droplet, or nothing is happening at all

 You probably forgot to input your API key, do that on `/settings`.

6.Other stuff

 Space is new and I don't have a ton of people to test it, so there are **certainly** problems I'm not aware of. If you encounter one, please open an issue and I'll take a look.

---

## Notes & Misc. 

* The password for the console will not be shown when you type (or paste), this is expected, it will still work. 
* If you are brave and try this and things break, please let me know so I can fix them :) 
