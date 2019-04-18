class User < ApplicationRecord
  # 下記はrefileを使用するときに必ず必要
  attachment :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :デバイスの機能名
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_manyで1:Nの1→Nの方向性を書いている、dependentはUserが削除されたら一緒に削除されるってこと
  has_many :books, dependent: :destroy

  validates :name,
    presence: true,
    uniqueness: { case_sensitive: :false },
    length: { maximum: 20 }

  validates :introduction,
    uniqueness: { case_sensitive: :false },
    length: { maximum: 50 }


end
