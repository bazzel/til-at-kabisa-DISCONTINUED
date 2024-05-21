# TIL@Kabisa

## Introduction

This is a simple Ruby on Rails application that shows 'Today I Learned''s.

## Prerequisites

- Install [all requirements](https://gorails.com/setup/macos/14-sonoma) on your machine
- PostgreSQL (instruction in the link above, but you can also use [asdf-postgres](https://github.com/smashedtoatoms/asdf-postgres) instead)

## Installation

```
$ git clone https://github.com/bazzel/til-at-kabisa.git
$ cd til-at-kabisa
$ asdf install # assuming you use asdf.
$ pg_ctl start # when you need to start your PostgreSQL server.
$ bundle install
$ yarn install
```

If you use a different username than `postgres` to connect to your PostgreSQL server, update the `username` key in `config/database.yml`.

```
$ bin/rails db:setup
```

## Running / Development

- `$ bin/rails s`
- `$ bin/webpack-dev-server`
- Visit your app at [http://localhost:3000](http://localhost:3000).

### Populate the database

The project comes with a `seed.rb` which you can use to populate your development environment. This seed is automatically used when running `bin/rails db:setup`. To (re-)run it at a later moment:

`$ bin/rails db:seed`

## Hosting

The application has been deployed to the following environments (not all may be available at the time of writing):

- ~~[Render](https://render.com/)~~
- ~~[Koyeb](https://www.koyeb.com/)~~
- ~~[Fly.io](https://fly.io/)~~

## Credits

- ...

## Further reading

- ...
