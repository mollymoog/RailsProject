class User < ApplicationRecord
  has_many :outcrops
  has_many :projects, through: :outcrops
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(username: data["name"], email: data["email"], password: password, password_confimation: password)
    end
    user
  end
        
end
