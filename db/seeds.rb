# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times do |n|
  User.create(
    first_name: "ManagerFirstName#{n}",
    last_name: "ManagerLastName#{n}",
    email: "manageremail#{n}@email.com",
    role: 'manager',
    password: '123123',
    state: 'confirmed'
  )
end

5.times do |n|
  User.create(
    first_name: "WorkerFirstName#{n}",
    last_name: "WorkerLastName#{n}",
    email: "workeremail#{n}@email.com",
    password: '123123',
    state: 'confirmed'
  )
end
