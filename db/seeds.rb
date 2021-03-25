# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email:    ENV['EMAIL1'],
  name:     ENV['NAME1'],
  password: ENV['PASSWORD']
)

User.create!(
  email:    ENV['EMAIL2'],
  name:     ENV['NAME2'],
  password: ENV['PASSWORD']
)

User.create!(
  email:    ENV['EMAIL3'],
  name:     ENV['NAME3'],
  password: ENV['PASSWORD']
)

Plot.create!(
  title: 'test1',
  body: 'This is test plot.',
  user_id: 1,
)
