# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー生成
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

User.create!(
  email:    'hoge2@hoge.com',
  name:     'hoge2',
  password: ENV['PASSWORD']
)

User.create!(
  email:    'hoge3@hoge.com',
  name:     'hoge3',
  password: ENV['PASSWORD']
)

# プロット生成
Plot.create!(
  title: '桃太郎',
  body: '<p>桃から生まれた</p>',
  user_id: 1,
)

Plot.create!(
  title: 'かぐや姫',
  body: '<p>竹から生まれた</p>',
  user_id: 2,
)

Plot.create!(
  title: '金太郎',
  body: '<p>まさかり装備</p>',
  user_id: 3,
)

Plot.create!(
  title: '千夜一夜物語',
  body: '<p>アラブ地域</p>',
  user_id: 1,
)

Plot.create!(
  title: 'シンデレラ',
  body: '<p>原作では「灰被り」</p>',
  user_id: 2,
)

Plot.create!(
  title: '赤ずきん',
  body: '<p>世界中に類話がある</p>',
  user_id: 3,
)
