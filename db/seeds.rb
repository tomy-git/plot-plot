# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email:    'hoge@hoge.com',
  name:     'hoge',
  password: 'hogehoge'
)

User.create!(
  email:    'ruby@hoge.com',
  name:     'ruby',
  password: 'hogehoge'
)

User.create!(
  email:    'ror@hoge.com',
  name:     'ror',
  password: 'hogehoge'
)

User.create!(
  email:    'aws@hoge.com',
  name:     'aws',
  password: 'hogehoge'
)

User.all.each do |user|
  user.plots.create!(
    title: 'test post plot',
    body: 'hoge hoge hoge hoge hoge, hoge hoge hoge hoge hoge.'
  )
end