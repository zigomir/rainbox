# Rainbox

Learning Chef.

## Setup

Install [VirtualBox](https://www.virtualbox.org/) and then [Vagrant](http://www.vagrantup.com/).

```bash
gem install berkshelf
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
git clone git://github.com/zigomir/rainbox.git ~/.rainbox && cd ~/.rainbox
```

## Usage for your projects

Create `Vagrantfile` and `Berksfile`

```bash
touch Vagrantfile && touch Berksfile
```

Berksfile content:

```ruby
cookbook 'rainbox', path: '~/.rainbox'
```

Vagrantfile content:

```ruby
eval(File.open("#{Dir.home}/.rainbox/Vagrantfile").read, binding, __FILE__, __LINE__)
```

### Configure vagrantconfig.yml for project

```yaml
project_name: <your-project-name>
box_name: precise64
box_url: http://files.vagrantup.com/precise64.box
memory: 512
guest_ip: 3.3.3.3

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

### Run it!

```bash
berks install
vagrant up
```


## Cookbook development

Add recipes to `metadata.rb` with `depends` and then include them in `recipes/default.rb` with `include_recipe`.

Then run `breks install`.

## Resources

- [Berkshelf.com](http://berkshelf.com/)
- [misheska.com](http://misheska.com/blog/2013/06/16/getting-started-writing-chef-cookbooks-the-berkshelf-way/)
- [misheska/myface](https://github.com/misheska/myface)

## Plan / TODO:

Setup fresh Ubuntu with docker and then install stuff with docker, create an image, use images for prod servers
