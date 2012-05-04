class Question < ActiveRecord::Base

  validates :title, :presence => true
  validates :description, :presence => true
#
  has_many :answers, :dependent => :destroy

  has_and_belongs_to_many :tags,
    :join_table =>'questions_tags',
    :foreign_key => 'tag_id',
    :association_foreign_key => 'question_id',
    :class_name => 'Tag'

end
