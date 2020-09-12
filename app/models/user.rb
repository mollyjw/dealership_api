class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true


  def generate_token!
    update_attribute :token, AccessToken.new(self).generate
  end

  def profile
    {
        id: id,
        first_name: first_name,
        last_name: last_name,
        nickname: nickname,
        token: token,
        email: email
    }

  end
end
