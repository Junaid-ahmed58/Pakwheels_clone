User.create(email: 'admin@junaidwheels.com', password: '787898', password_confirmation: '787898', role: 'admin') if User.find_by(email: 'admin@junaidwheels.com').nil?
