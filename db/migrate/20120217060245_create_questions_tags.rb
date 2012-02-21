class CreateQuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags, :id => false do |t|
      t.integer :question_id
      t.integer :tag_id

      t.timestamps
    end
   
  end
end
