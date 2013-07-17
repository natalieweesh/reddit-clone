class Comment < ActiveRecord::Base
  attr_accessible :content, :parent_comment_id, :link_id

  validates :content, presence: true
  
  belongs_to :link
  belongs_to :parent_comment, :class_name => "Comment"

end