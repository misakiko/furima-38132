class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end


validates :nickname, presences: true
validates :last_name, presences: true
validates :first_name, presences: true
validates :last_name_kana, presences: true
validates :first_name_kana, presences: true
validates :birthday, presences: true


パスワード半角英数字
validates :カラム名(シンボルで指定),検証ルール（こちらもシンボルで指定）
/^[a-zA-Z0-9]+$/