User.create(email: 'admin@test.com', password: 'password') unless User.find_by(email: 'admin@test.com')
User.create(email: 'satou@test.com', password: 'password') unless User.find_by(email: 'satou@test.com')

Tweet.create(sentence: "いいかんじ")
Tweet.create(sentence: "めっちゃいいかんじ")

