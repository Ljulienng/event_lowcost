# EvenLite
## Made by Julien and Maxence :smiley:
## How to use

After the git clone, run the commands in this order: `bundle install`,`rails db:create`, `rails db:migrate`, `rails db:seed`.


Open `rails server`, then create a user with `u = User.create(first_name: yourname, email: youremail@yopmail.com)` you'll normally receive an email from the UserMailer.


Take an event already created by changing his admin_id with your id.


To create an attendance type this on your rails console: `a = Attendance.create(user: User.all.sample, event: Event.find(Your event))` and you'll also receive a mail about a new user joining your event.


## Content

In this repo you'll find an the liter version of "EventBrite": [EvenLite](https://event-lite1.herokuapp.com)

## Here is the meme


![meme](https://cdn-images-1.medium.com/max/1600/1*l_T-OzVE9gp0fOAf8vOwbw.png)
