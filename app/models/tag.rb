class Tag < ActiveRecord::Base

  validates :title, :presence => true
  validates :description, :presence => true
  
  has_and_belongs_to_many :questions,
    :join_table =>'questions_tags',
    :foreign_key => 'question_id',
    :association_foreign_key => 'tag_id',
    :class_name => 'Question'

  
end
