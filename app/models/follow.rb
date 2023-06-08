class Follow < ApplicationRecord
  belongs_to :followers, class_name: "User"
  belongs_to :followed, class_name: "User"
end
