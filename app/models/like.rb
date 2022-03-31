class Like < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true

end
