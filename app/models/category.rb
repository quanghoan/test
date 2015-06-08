class Category < ActiveRecord::Base
  has_many :parrent_relationships, class_name: "Relationship",
    foreign_key: "parrent_id", dependent: :destroy
  has_many :parrents, through: :parrent_relationships, source: :child
  has_many :child_relationships, class_name: "Relationship",
    foreign_key: "child_id", dependent: :destroy
  has_many :children, through: :child_relationships, source: :parrent
  has_many :questions, dependent: :destroy
  
  validates :name, presence: true

  def receive_parrent(other_category)
    child_relationships.create(parrent_id: other_category.id)
  end

  def un_receive_parrent(other_category)
    child_relationships.find_by(parrent_id: other_category.id).destroy
  end

  def parrent_of?(other_category)
    parrents.include?(other_category)
  end
end
