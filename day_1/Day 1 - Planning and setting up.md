# Day 1 - Planning and setting up
## The plan

For this 100 days of code challenge, my plan is to review and improve my own SQL skills, filling any possible gap. I want to set up and use a PostgreSQL database in the cloud, and connect and interact with it using DBeaver, an open source tool to create directly SQL queries and scripts, and later python.

I would like to review all the basic components of the language, providing examples about how to use for, on the first stages, store and manage data, and how to analyse using more advance tools later.

All the files, examples and scripts will be available on a GitHub repository, so anyone would be able to reproduce the same exercises and examples. 

If there is any issue or question, you can write to jfpalomeque.gonzalez@gmail.com

## The DB in the cloud
As mentioned, I will use a PostgreSQL database hosted in a cloud provider. I will be using Heroku, that in their free plan, "Hobby Dev", offer a lot of functionalities, and don't require a Bank Card to sign in. All the functionalities can be checked here: https://elements.heroku.com/addons/heroku-postgresql

We can go to https://id.heroku.com/login and click to Sign Up. There we can fill all our personal details, and we will receive an email to confirm our email address.
![[Pasted image 20220718195808.png]]Once that has been done, we can create a password, accept the terms and conditions, and reach a menu where we can create a new web app.
![[Pasted image 20220718200059.png]]
![[Pasted image 20220718200145.png]]
Once the app has been created, we can go to https://elements.heroku.com/addons/heroku-postgresql, and click on Install Heroku Postgres
![[Pasted image 20220718200254.png]]
On the field App to provision to, we can write the name of our app (a-hundred-days-of-sql) and click on Submit Order Form
![[Pasted image 20220718200355.png]]
And we have our database ready, as can be seen on the main page:
![[Pasted image 20220718200427.png]]
If we click to Heroky Postgres, Settings and Database Credentials, we can see the credentials we will need later to connect DBeaver to the database.
![[Pasted image 20220718200615.png]]

## DBeaver
Dbeaver is a *Free multi-platform database tool for developers, database administrators, analysts and all people who need to work with databases* as is explained in their website https://dbeaver.io/. From https://dbeaver.io/download/ we can download and install the latest version for our OS.
![[Pasted image 20220718200747.png]]
Once the program has been installed, we will go to Database > New Database Connection

![[Pasted image 20220718200844.png]]
Select PostgreSQL
![[Pasted image 20220718200915.png]]
And add the credentials we saw earlier in heroku, host, database, username, password, etc... 
![[Pasted image 20220718201007.png]]
Once all the information has been added, we can click to Test Connection, to see that everything works. 
![[Pasted image 20220718201326.png]]
If everything works, we can go to SQL Editor > Open SQL console
![[Pasted image 20220718202821.png]]
And on the new console write: 
SELECT version();
and run the query, that should show the PostgreSQL version. And that is our first SQL query!
![[Pasted image 20220718202844.png]]
