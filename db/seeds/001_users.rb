User.find_or_create_by(email: 'myemail@aol.com', password_digest: BCrypt::Password.create('mypassword123'))
User.find_or_create_by(email: 'tommyjohn@yahoo.com', password_digest: BCrypt::Password.create('callme456'))
User.find_or_create_by(email: 'sallysanders@gmail.com', password_digest: BCrypt::Password.create('rainbow789'))