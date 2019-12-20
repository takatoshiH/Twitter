user = User.create(email: 'admin@test.com', password: 'password', name: "tanaka") unless User.find_by(email: 'admin@test.com')

Tweet.create(sentence: "いいかんじ", user_id: user.id)
Tweet.create(sentence: "めっちゃいいかんじ", user_id: user.id)