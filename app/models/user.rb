# TEM QUE TIRAR OS RESCUES DOS MÉTODOS, POR QUE VAI PARAR DE DISPARAR ERROS
class User < ActiveRecord::Base
  has_many :posters 
  has_many :categories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth(auth_hash)
    info = auth_hash[:info]
    credentials = auth_hash[:credentials]
    raw = auth_hash[:extra][:raw_info]
    user = User.find_or_initialize_by(email: info[:email])
    user.id_facebook = auth_hash[:uid]
    user.name = info[:name]
    user.image = info[:image]
    user.location = info[:location]
    user.gender = raw[:gender]
    user.birthday = convert_birthday(raw[:birthday])
    user.facebook_token = credentials[:token]
    user
  rescue
    user
  end
private
  def self.convert_birthday(date_str)
    begin
      DateTime.strptime(date_str, "%m/%d/%Y")
    rescue
      DateTime.strptime(date_str, "%m/%d")
    end
  rescue
    nil
  end
end
