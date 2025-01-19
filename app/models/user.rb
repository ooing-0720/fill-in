class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :naver, :kakao, :google_oauth2 ]

  def self.find_for_oauth(auth, current_user)
    # check if alreary existed
    email = auth.info.email
    user = User.where(email: email).first

    if not self.where(email: auth.info.email).exists?
      if user.nil?
        user = User.new(name: auth.info.name, email: email ? auth.info.email : "#{auth.uid}@#{auth.provider}.com", password: Devise.friendly_token[0, 20])
        user.save!
      end
    end
    user
  end
end
