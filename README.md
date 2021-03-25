# Twitter_redesign_capstone

## About

In this project, I build an application named twitter_redesign which is a capstone project, and that works similar like Twitter. The main goal is to put into practice the main concepts of rails MVC. The app allows users to create tweets and then manage user sign-in/signups. Users can create tweets and follow or unfollow other users. A user is able to see how many users follow him/her and can see the total number of users he/she follows.

A user can create many tweets. A user can follow many users and a user can have many followers. For this, many-to-many model relationships are implemented.

A follower/followed is a user, therefore, a self join relationship is created between the user and the following table.

## Built with

* Ruby on rails
* Postgresql
* rubocop linters
* Vs code
* bootstrap

## Getting Started

Enjoy app features by openning the link below in the blowser.

[Live link](https://tweet-social.herokuapp.com/)

### Have a copy

Here is a short video to take you through the app.

Note: the video only shows the screen due to camera driver not working on my laptop.

[Getting started Viddeo](https://www.loom.com/share/631c333bed114bd78a324647b3621757)

## Setup

To get started, you should first get this file in your local machine by cloning or forking this project or typing in your terminal

> git clone https://github.com/elisha2kyakpo1/twitter_redesign_capstone.git

Before you start using the app, you need to be sure that you have Ruby installed on your computer, by typing.

> ruby -v

You should see your version of ruby.
If it's not installed in your system, follow this [guide](https://www.ruby-lang.org/en/documentation/installation/) and it will help you to get it done.

Then you can install rails using this command,

> gem install rails

And you can also check your rails version by typing in your terminal

> rails -version

After that do bundle install to install all required gems and dependences

> bundle install

Install yarn by running the command below
> yarn install

Since we are using postgresql database, run this command in your tenimal to create the database

> rails db:create

Finally, run the migration to populate your database to have the tables
> rails db:migrate

You then interract with the program from rails server on the web by

> rails s

Open your favourite blowser and type the command below
> http://localhost:3000

## Contributors

## Elisha Kyakopo

  Linkedin: [Elisha Kyakopo](https://www.linkedin.com/in/elisha-kyakopo/)

  Github: [@elisha2kyakpo1](https://github.com/elisha2kyakpo1)

  Twitter: [@elisha1k](https://twitter.com/Elisha1k)

## Contributions

Contributions, issues and requests are welcome

## Show support

Give a star if you like the project
