class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  def name_followed(followed)
    user = User.find(followed)
    user.username
  end
end
