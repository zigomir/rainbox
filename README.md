# Rainbox

Learning Chef and later Docker.

## Setup

Install [VirtualBox](https://www.virtualbox.org/) and then [Vagrant](http://www.vagrantup.com/).

```bash
gem install berkshelf
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
```

## Usage

Create `Berksfile` in your project root and put this line into it

```
cookbook 'rainbox', git: 'git@github.com:zigomir/rainbox.git'
```

```bash
berks install
vagrant up
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
