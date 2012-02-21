class Answer < ActiveRecord::Base
  
  belongs_to :questions, :foreign_key => :question_id

  validates :answer_content, :presence => true
  validates :question_id, :presence => true
end
