# README

This is my first Ruby on Rails application!

Thanks to GoRails.com -- great tutorial.  I was able to work through that tutorial,
and then decided to create a Ruby on Rails app to rewrite my 
Promineo Tech BESD Coding Bootcamp Final Project.

Using the gorails.com template, I was able to create a simple interface in my browser.


* Ruby version:  ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-darwin19]

* Rails version:  Rails 6.1.3

* PostgreSQL version:  psql (PostgreSQL) 13.2

I will add the rest of this information when I get further along in this implementation!
----------------------------------------------------------------------------------------

* How to run the test suite:  In process

* Deployment instructions: 

		- Rails db:create
		
		- Rails db:migrate
		
		- In the terminal, run: Rails S
		
		- In the browser of your choice:    127.0.0.1:3000 (or localhost:3000)
		
		- Follow the instructions... 
		
* This app has the following functionality:

		-  Create Users --  Musicians or Planners (Gigs)
		
				-- email must be unique
				
				-- password must match re-entered password -- secure password
				
				-- instrument must exist in database
				
				-- valid "role" must be entered
				
		-  Create Instruments -- Any instrument, name must be unique
		
		-  Create Gig 
		
		-  Show Users, Instruments and Gigs 
		
		-  Add multiple instruments to Gigs and Musicians
		
		-  A musician can:
		
				-- request a Gig 
				
						-- checks that they play the instrument requested
						
						-- checks that the Gig needs that instrument, & it is available.
									
		-  A planner can:
		
				-- hire a musician that has requested a gig
				
				-- change the status of a Gig (planned, available, closed, cancelled)
				
		
----------------------------------------------------------------------------------------

