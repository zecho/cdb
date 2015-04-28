# cdb -- Comic Database

Welcome to cdb! ComicGator was imagined as a multi component system. So it never made sense that the database would be 'owned' by the webapp and therefore a more traditional ORM managed approach would introduce more complexity than was necessary.

This repository represents the [sqitch](http://sqitch.org/) organized postgresql schema for ComicGator. No knowledge of sqitch is required to run cdb but it definitely informs how the database is extended and migrated which this readme covers in more detail below.

## Getting started
The two pillars of infrastructure for ComicGator ([lurker](https://github.com/comicgator/lurker) and [maestro](https://github.com/comicgator/maestro)) each depend on cdb so this is a good place to start. Inside this repository is a VagrantFile which describes a virtual machine and provisioning script which makes installation fairly painless.

Prerequisites are [vagrant](https://www.vagrantup.com/) v1.7.2 and some type of virtualization product, I recommend [virtualbox](https://www.virtualbox.org/) v4.3.26 because it is free.

```
git clone git@github.com:comicgator/cdb.git
cd cdb
vagrant up
```

Now go [joust office chairs](http://xkcd.com/303/) or whatever flavor of procrastination you prefer. This is gonna take a while.

cdb uses a vanilla ubuntu/trusty64 box which some vagrant users might have already. But even with that preinstalled, sqitch is pretty hefty and will take 20 minutes or so to acquire.

If you see `Good Hunting` and no tramatic error messages then cdb is now installed and running in a virtual machine. By default I have both port forwarding and a private network enabled. This means that you can access the database at `localhost:5432` and `192.168.33.10:5432` the local environments for luker and maestro both access it through the private IP address. The localhost port forwarding is for convenience but if it isn't then you can comment that line out in the VagrantFile and run `vagrant reload`.

Run `vagrant halt` to suspend the vm. If you feel the need to start from scratch then `vagrant destroy` is your huckleberry.

## Why

I assume you are asking why is your database version controlled and what is this beast called sqitch.

 


## Contributing


## License
cdb is created under the lovely MIT license, see the LICENSE file for more information.


