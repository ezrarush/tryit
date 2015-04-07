class MenuItem < ActiveRecord::Base
  belongs_to :menu
  acts_as_taggable_on :tags, :categories
end
