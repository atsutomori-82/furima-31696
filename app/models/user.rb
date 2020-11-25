class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :orders
         has_many :items

        with_options presence: true do
         validates :nickname, length: { maximum: 40 }
         validates :family_name
         validates :first_name
         validates :family_name_kana
         validates :first_name_kana
         validates :birthday
        end
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
          validates :family_name
          validates :first_name
         end
         with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
          validates :family_name_kana
          validates :first_name_kana 
        end
          VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
          validates :password, format: { with: VALID_PASSWORD_REGEX }
      end
