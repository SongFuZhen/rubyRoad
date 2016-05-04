class Event < ActiveRecord::Base
  # 表示必须填写
  validates_presence_of :name
end
