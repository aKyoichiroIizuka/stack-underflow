class CreateQuestionComments < ActiveRecord::Migration
  def change
    create_table :question_comments do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
