Project started with 
`rails new zssn --api --skip-keeps --skip-spring --skip-bootsnap --skip-test --database=postgresql`

$> sudo -u postgres psql

=# create user zssn with password 'zssn123';  

=# alter role zssn superuser createrole createdb replication; 

=# create database projectname owner zssn;

For the sake of simplicity, the api is not versioned (since this is the end of the world, there will be no version 2)

TODO:
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
- add tests
- add reports
- add model or service validations
- describe project architecture on readme
- dockerfile, docker-compose (web, db,redis)
- upload to ec2 instance, expose public ip
- create postman collection
