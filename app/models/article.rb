class Article < ActiveRecord::Base
  # 一篇文章可以很多个评论   同时删除关联对象
  has_many :comments, dependent: :destroy
  attr_accessible :text, :title
  validates :title, presence: true,
            length: {minimum: 5}
end

