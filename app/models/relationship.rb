class Relationship < ActiveRecord::Base
  belongs_to :parrent, class_name: "Category"
  belongs_to :child, class_name: "Category"

  validates :parrent_id, presence: true
  validates :child_id, presence: true
end