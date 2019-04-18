class Book < ApplicationRecord

# belongs_toはBooksモデルからuser_idに紐づいてUserモデルを参照できることを指しています。こちらはBookモデルに紐付くのは1つのUserモデルなので単数形になる点に注意してください。

  belongs_to :user

  validates :book_title,
    presence: true,
    length: { maximum: 200 }
  validates :book_body,
    presence: true,
    length: { maximum: 200 }

end
