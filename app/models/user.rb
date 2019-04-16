class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :デバイスの機能名
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # has_manyで1:Nの1→Nの方向性を書いている、dependentはUserが削除されたら一緒に削除されるってこと
  has_many :post_images, dependent: :destroy
end
