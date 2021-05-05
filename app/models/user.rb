class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options length: {minimum:6}, 
  format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "Include both letters and numbers"}, allow_blank: true do
    validates :password
    validates :password_confirmation
  end

  with_options presence: true do
    validates :nickname, length:{maximum:40}
    validates :birth_date
    validates :family_name
    validates :first_name
    validates :family_name_kana 
    validates :first_name_kana

    with_options format: {with: /\A[ぁ-んァ-ン一-龠々]+\z/, message: "Full-width characters"},allow_blank: true do
      validates :family_name
      validates :first_name
    end
    
    with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }, allow_blank: true do
      validates :family_name_kana 
      validates :first_name_kana
    end
  end
end