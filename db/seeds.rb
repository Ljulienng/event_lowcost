# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

54.times do
  user = User.create!(first_name: Faker::Name.unique.first_name,
  										last_name: Faker::Name.last_name, 
  										description: Faker::Movies::Lebowski.quote, 
  										email: "#{Faker::Name.unique.last_name}@yopmail.com", password: "123456" )
end

26.times do
	event =Event.create!(start_date: rand(2.months).seconds.from_now, 
											duration: (rand(1..25)*5), 
											price: rand(1..1000), 
											title: Faker::Book.unique.title, 
											location: Faker::TvShows::GameOfThrones.city, 
											description: Faker::Movies::Lebowski.quote * 2,admin_id: User.all.sample.id)
	while event.title.length < 4
		event.title = Faker::Book.title
	end
end

43.times do
	attendance = Attendance.create!(event: Event.all.sample, 
																	user: User.all.sample)
end