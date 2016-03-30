class Comment < ActiveRecord::Base
  # 一个评论只属于一篇文章
  belongs_to :article
  attr_accessible :body, :commenter
end
