# Rainbox

Learning Chef and later Docker.

## Setup

Install [VirtualBox](https://www.virtualbox.org/) and then [Vagrant](http://www.vagrantup.com/).

```bash
gem install berkshelf
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
git clone git://github.com/zigomir/rainbox.git ~/.rainbox && cd ~/.rainbox
berks install
```

## Usage

```bash
cd /path/to/project
~/.rainbox/vagrantify.sh .

# edit the vagrantconfig.yml
vagrant up
```

Create `Berksfile` in your project root and put this line into it

```
cookbook 'rainbox', git: 'git@github.com:zigomir/rainbox.git'
```

```bash
berks install
vagrant up
```


### vagrantconfig.yml for project

```yaml
# Default config for Vagrant
# use vagrantconfig_local.yml to override these settings and put it to .gitignore

project_name: rainbox
box_name: precise64
box_url: http://files.vagrantup.com/precise64.box
memory: 512
guest_ip: 192.168.1.10

ports:
  - {guest: 3000, host: 3000}

chef_conf:
  databases:
    - postgres

  packages:
    - vim

  languages:
    ruby:
      version: 2.0.0-p353

```

Vagrantfile

```ruby
eval(File.open("#{Dir.home}/.rainbox/Vagrantfile").read, binding, __FILE__, __LINE__)
```

## Process

Add recipes to `metadata.rb` with `depends` and then include them in `recipes/default.rb` with `include_recipe`.

Then run `breks install`.

## Resources

- [Berkshelf.com](http://berkshelf.com/)
- [misheska.com](http://misheska.com/blog/2013/06/16/getting-started-writing-chef-cookbooks-the-berkshelf-way/)
- [misheska/myface](https://github.com/misheska/myface)

## Plan/TODO:

Setup fresh Ubuntu with docker and then install stuff with docker, create an image, use images for prod servers

Use this for Postgres, seems better: http://phlippers.net/chef-postgresql/
