class Book < ApplicationRecord

# belongs_toはBooksモデルからuser_idに紐づいてUserモデルを参照できることを指しています。こちらはBookモデルに紐付くのは1つのUserモデルなので単数形になる点に注意してください。

  belongs_to :user

end
