class ChangeColumnTypeOfAnswers < ActiveRecord::Migration
  def up
    change_column :answers, :content, :text
  end
  def down
    change_column :answers, :content, :string
  end
end
