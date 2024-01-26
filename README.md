## Setup:
- Clone this repository

- If you have postgres already installed, add this project's user
```
# At the terminal:
sudo -u postgres psql

# And then, inside postgres:
create user zssn with password 'zssn123';
alter role zssn superuser createrole createdb replication;
create database projectname owner zssn;
```

- You can also run as containers:

`docker compose up`

`docker exec -ti zssn_api bundle exec rails db:setup`


## Play Testing

For automatic tests, just run:

`rspec` (or `rspec -fd` for a nice verbose description)

For manually testing the API, use Postman, either locally or from my public collection:
https://www.postman.com/adrield/workspace/adinelli/collection/1850349-af5f2846-1e44-4869-9ee4-e2aaccc57a0e?action=share&creator=1850349&active-environment=1850349-736bdbca-a438-4c6f-a830-adf8b680304d

Make sure `zssn_hosted` is selected on environments to test it online, or simply copy everything to your local machine and use your localhost

There are already some users seeded into the databse, you may recognize them from famous zombie games :)

There are only 4 items available for now, as instructed. You can use their ids in ZSSN's API:

ID: 1, Water, 4 points

ID: 2, Food, 3 points

ID: 3, Meds, 2 points

ID: 4, Ammo, 1 point


## Structure

Project started with 
`rails new zssn --api --skip-keeps --skip-spring --skip-bootsnap --skip-test --database=postgresql`

I also disabled action-mailer, action-jobs, action-cable, but did not remove them entirely, in case I decided to do something with those
(like a chat, or email service).

For the sake of simplicity, the api is not versioned (since this is the end of the world, there will be no version 2)

As a small project, Rails' MVC pattern is mostly sufficient, by I personally like to separate CRUD operations and other business
rules into pure ruby classes in `app/services`. Other core classes were put into `app/lib`.

I took the decision to record who were the users reporting their infected pals. It's easier to check if each notification come from
unique users, rather then one single person spamming the notification endpoint.

To make things easier, I added an endpoint to list the user's inventory.


## Infra

This project is hosted in a small t2 EC2 machine on AWS. Nothing fancy, just a cheap alternative since Heroku doesn't provide free instances anymore :/

It runs on docker compose and mapped with a simple nginx config:

```
server {
  listen 80;
  server_name ec2-54-91-227-121.compute-1.amazonaws.com;

  location / {
    proxy_pass http://localhost:3000;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
  }
}
```

Note the domain is in HTTP, since Certbot doesn't work with `amazonaws.com` by policy, I tried...

(and it didn't make sense to buy a domain just to setup HTTPS for this code challenge)


## TODO:
- parametize exceptions
- add i18n to exceptions
- use google geolocal api to search for lat / lng from an address
- Trade Manager:
  - let trade happen in a multi-staged transaction (add, remove itens, compare, etc, before closing the deal)
  - add it's own controller
  - have temporary persistency with redis
  - validate user, items, availability
  - normalize in case users are trying to trade the same items
  - refactor item comparison and exchange
- add tests (add more cases, controllers)
- add more service validations
