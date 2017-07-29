# Whiteboardr
# Final Project - Dev Bootcamp - August, 2017

# Team Members:
Joel Guerra
Jeremy Lee
Kris Weber
Jordan "Sparky" Levine

# Description
This web application provides a platform for job candidates to receive feedback on mock whiteboarding sessions, common during technical interviews. During a mock interviewer, an "interviewer" will enter the name of the "applicant" and select a challenge. "Reviewers" may access the interview and leave feedback for the applicant. The applicant may later log in and see his or her feedback.

It is suggested that feedback follow the "ASK" model: feedback should be:

* actionable
* specific, and
* kind

# Technologies Used:
* Ruby version 2.3.1 
* Rails version 5.0.4 (web app framework)
* PostgreSQL version 9.6.2 (database)
* Javascript/CSS/HTML (front-end technologies)
* Heroku (for deployment)
* Circle CI (for continuous integration support)
* GitHub (for version control)
* Sorcery (Ruby gem for user authentication)
* RSpec (for testing)
* Simplecov (for test coverage statistics)
* FactoryGirl (for creating resource objects for testing)
* Faker (for creating resources for testing and seed file creation)

# System dependencies

# Local Configuration
1. mkdir whiteboardr
2. cd whiteboardr
3. git clone <copy URL for this repository>
4. bundle install
5. bundle exec rails db:create (database creation)
6. bundle exec rails db:migrate (database initialization)
7. bundle excec rails db:seed (database seeding - optional)
8. bundle exec rails server (to start web server)
8. go to localhost:3000 to display home page

# How to run the test suite
bundle exec rails spec

# Deployment instructions
To deploy to Heroku:
1. Create a new application in Heroku.
2. Choose GitHub as deployment method.
3. Enter the GitHub repository to connect the application to GitHub.


# User Guide
Welcome to Whiteboardr - one-stop shopping for all of your mock whiteboarding needs! Use this web application to help facilitate mock whiteboarding sessions and provide feedback for job candidates. 

# To Start an Interviewing Session
From the home page, the interviewer may click "Start an Interview", enter the username of the job candidate, and select a challenge from the drop down list of challenges. These challenges are sorted by difficulty level: easy, medium, or hard.

# To Enter Feedback for a Candidate
Once the interview session has been started, it will appear on the home page. Reviewers may click on the interview to:
* see details about the interview (challenge, candidate, interviewer, etc.)
* enter feedback (make sure that feedback is actionable, specific, and kind!)

# To Create a New Challenge
To create a new challenge, click "Add a Challenge" on the home page. Enter challenge details and click "Create".

# To See Your Profile Information
To view your profile information, click the "My Profile" link at the top of any page. There, you will see your user information and a list of interviews in which you were the job candidate. 

# To See Feedback for an Interview
To see feedback for an interview in which you were the job candidate, navigate to the interview details screen, accessible from the home page and the profile page. Once there, click "See My Feedback" to see all feedback that has been given for the interview.






* Services (job queues, cache servers, search engines, etc.)


