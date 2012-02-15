class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :views
      t.integer :user_id
      t.integer :guest_id

      t.timestamps
    end
  end
end
