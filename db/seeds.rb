# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: 'hoan admin',email: 'hoan@gmail.com',
  password: "12345678",
  password_confirmation: "12345678",
  role: "admin")
User.create!(name: 'hoan examiner', email: 'hoan1@gmail.com',
  password: "12345678",
  password_confirmation: "12345678",
  role: "examiner")
User.create!(name: 'hoan examinee', email: 'hoan2@gmail.com',
  password: "12345678",
  password_confirmation: "12345678",
  role: "nomal")
TypeQuestion.create!(name: "Choice question",
  description: "Each question has 4 options")
TypeQuestion.create!(name: "Text question",
  description: "Each question has no option")
LevelCategory.create!(name: "Easy level", description: "Easy questions will be create here")
LevelCategory.create!(name: "Difficult level", description: "Difficult questions will be create here")