#Donation Station

This is a project using Ruby on Rails, HTML5, CSS3, Javascript, jQuery, Devise authentication, and the Stripe API. It's a responsive web app for donating funds to various non-profit organizations. Here's what it does:

* Adds new non-profits to the list
* Creates a non-profit as a Stripe recipient
* Tokenizes credit and debit card information
* Allows a logged in user to make a one time only donation
* Allows a logged in user to create a subscription to a specified non-profit
* Allows an admin to transfer funds to a non-profit

Check out Donation Station on Heroku:
http://donation-station.herokuapp.com/

##Installation
Clone this repo in your terminal:

```console
$ git clone https://github.com/AmyVS/donation_station.git  (or)
$ git clone https://github.com/randyleighton/donation_station-stripe-api.git
```

If you haven't already, be sure to install [postgres](http://www.postgresql.org/download/):

```console
$ postgres
```

Run bundle to install all the gems associated with the repo:

```console
$ bundle install
```

Get your databases all set up:

```console
$ rake db:create
$ rake db:migrate
```

Start your local rails server:

```console
$ rails s
```

Open your favorite brower to localhost:3000 and you should be good to go!


---
**MIT License Copyright (c) 2014 Amy Vaillancourt-Sals and Randy Leighton**

---
