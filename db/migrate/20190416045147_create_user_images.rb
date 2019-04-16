class CreateUserImages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_images do |t|
      # image_idは自動的にidでは無くファイルが入る
      t.text :image_id
      # hasmany,belongs_toでUserモデルとuser_idがつながっている
      t.integer :user_id
      
      t.text :caption

      t.timestamps
    end
  end
end
