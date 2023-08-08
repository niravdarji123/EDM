# README.md

Steps to deploy the application locally :

* run "bundle install" to install the gem dependencies

* type "sudo -u postgres psql"
  - type "ALTER USER postgres WITH PASSWORD 'root';"
  - type "grant all privileges on database EDM_development to postgres;"
  - enter \q to exit.

* ls /etc/postgresql ( output will be the version of the postgresql )
* sudo nano /etc/postgresql/14/main/pg_hba.conf ( replace first 2 'peer' with 'md5' in pg_hba.conf and save it. )
* sudo service postgresql restart
* psql -h localhost -U postgres
  - type \q to exit

Execute

* rails db:create
* rails db:migrate
* rails db:seed
* rails s (to start the rails server)

* Now install ngrok on your system.
* run ngrok on the same port as of the rails server.

* Copy the link.

* go to browser and hit the url on which the rails server is running ( i.e : http://localhost:3000 )

* Login using this credentials
  - Email : "test@dummymail.com"
  - Password : "password"

* You will see the dashboard with a Send Email Button and a table showing data of all the events

* Enter any valid email and click send email, wait for the event to be captured.

* The data will be reflected to the database as soon as any event got captured.
