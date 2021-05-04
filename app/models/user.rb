class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password,:password_confirmation,length:{minimum:6},
              format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "Include both letters and numbers"}
  validates :nickname,         presence:true, length:{maximum:40}
  validates :family_name,:first_name, presence:true, 
              format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :family_name_kana, :first_name_kana, presence:true,
              format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
  validates :birth_date,       presence:true
end
