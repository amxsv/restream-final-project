# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

manager = User.create(
    first_name: "ManagerFirstName",
    last_name: "ManagerLastName",
    email: "manageremail@email.com",
    role: 'manager',
    password: '123123',
    state: 'confirmed'
)

worker = User.create(
    first_name: "WorkerFirstName",
    last_name: "WorkerLastName",
    email: "workeremail@email.com",
    password: '123123',
    state: 'confirmed'
)

manager_ids = [manager.id]
3.times do |n|
  new_manager = User.create(
    first_name: "ManagerFirstName#{n}",
    last_name: "ManagerLastName#{n}",
    email: "manageremail#{n}@email.com",
    role: 'manager',
    password: '123123',
    state: 'confirmed'
  )
  manager_ids << new_manager.id
end

worker_ids = [worker.id]
5.times do |n|
  new_worker = User.create(
    first_name: "WorkerFirstName#{n}",
    last_name: "WorkerLastName#{n}",
    email: "workeremail#{n}@email.com",
    password: '123123',
    state: 'confirmed'
  )
  worker_ids << new_worker.id
end

55.times do |n|
  Task.create(
    title: "Task#{n}",
    description: "Description#{n}",
    due_date: '2016-07-25 12:00',
    assigned_user_id: worker_ids.sample,
    author_id: manager_ids.sample
  )
end
