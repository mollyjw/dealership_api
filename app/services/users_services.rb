class UsersServices

    def self.login(email, password)
        return false unless user = User.find_by(email: email).try(:authenticate, password)
        user.generate_token!
        user
      end
    
      def self.register(email, first_name, last_name, nickname, password, password_confirmation)
        user = User.new({
                            email: email,
                            first_name: first_name,
                            last_name: last_name,
                            nickname: nickname,
                            password: password,
                            password_confirmation: password_confirmation
                        })
    
        return false unless user.valid?
    
        user.save
        user.generate_token!
        user
      end
    
      def self.logout(user)
        user.update(token: nil)
      end

end