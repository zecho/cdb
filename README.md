# cdb -- Comic Database

Welcome to cdb! ComicGator was imagined as a multi component system. So it never made sense that the database would be 'owned' by the webapp and therefore a more traditional ORM managed approach would introduce more complexity than was necessary.

This repository represents the [sqitch](http://sqitch.org/) organized PostgreSQL schema for ComicGator. No knowledge of sqitch is required to run cdb but it definitely informs how the database is extended and changed which this README covers in more detail below.

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

It is assumed you are asking why is this database version controlled? And what is this beast called sqitch?

The answer to both these questions comes with the acquisition of a working knowledge of [sqitch](http://sqitch.org/). The short explanation is the sqitch is a giant Perl library that manages changes to anything with SQL in the name and does so in manner that is friendly to any vcs.

In the case of cdb; the SQL is PostgreSQL, and the vcs is git. This repository's primary feature is the sqitch.plan file, which provides an index and ordering of the set of sql files that represent the cdb schema. Sqitch organizes this set of files in three folders; deploy, verify, and revert. Each filename triplicated across these folders and the sql scripts within implement the deployment, verification and reversion of some isolated change in the schema.

Groups of these files can be tagged with a version, and then later reworked so that the database can easily migrate from one version to any other and back again.

Sqitch provides a source of truth and security for evolving a database through development and after deployment.

## License
cdb is created under the lovely MIT license, see the LICENSE file for more information.


