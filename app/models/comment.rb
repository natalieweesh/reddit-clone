class Comment < ActiveRecord::Base
  attr_accessible :content, :parent_comment_id, :link_id

  belongs_to :link
  belongs_to :parent_comment, :class_name => "Comment"

end