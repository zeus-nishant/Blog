class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog_post
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'Comment', optional: true
end
