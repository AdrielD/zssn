Project started with 
`rails new zssn --api --skip-keeps --skip-spring --skip-bootsnap --skip-test --database=postgresql`

$> sudo -u postgres psql

=# create user zssn with password 'zssn123';  

=# alter role zssn superuser createrole createdb replication; 

=# create database projectname owner zssn;

For the sake of simplicity, the api is not versioned (since this is the end of the world, there will be no version 2)
