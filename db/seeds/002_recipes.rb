Recipe.find_or_create_by(name: 'pizza', user_id: '2', created_at: Time.now)
Recipe.find_or_create_by(name: 'salad', user_id: '1', created_at: Time.now - 1.days)
Recipe.find_or_create_by(name: 'pancakes', user_id: '3', created_at: Time.now - 2.days)