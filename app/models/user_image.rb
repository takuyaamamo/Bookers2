class UserImage < ApplicationRecord
  
  # belongs_toは1:NのN→1の関係を書いている、userモデルを指定することでUserモデルのidがPostImageのuser_idに移動的に関係を持つ
  belongs_to :user

end
