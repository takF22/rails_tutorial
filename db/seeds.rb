# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Blog.create([{ title: '記事タイトル1', content: '記事の内容1', user_id: '1'}])
Blog.create([{ title: '記事タイトル2', content: '記事の内容2', user_id: '1'}])
Blog.create([{ title: '記事タイトル3', content: '記事の内容3', user_id: '1'}])
Blog.create([{ title: '記事タイトル4', content: '記事の内容4', user_id: '1'}])
Blog.create([{ title: '記事タイトル5', content: '記事の内容5', user_id: '1'}])
Blog.create([{ title: '記事タイトル6', content: '記事の内容6', user_id: '1'}])
Blog.create([{ title: '記事タイトル7', content: '記事の内容7', user_id: '1'}])
Blog.create([{ title: '記事タイトル8', content: '記事の内容8', user_id: '1'}])
Blog.create([{ title: '記事タイトル9', content: '記事の内容9', user_id: '2'}])
Blog.create([{ title: '記事タイトル10', content: '記事の内容10', user_id: '2'}])
User.create([{ name: "田中太郎", user_id:"1", password_digest:"test1234"}])
User.create([{ name: "山田やまこ", user_id:"2", password_digest:"test1234"}])
Comment.create([{ user_id: "1", body:"いいね", blog_id:"1"}])