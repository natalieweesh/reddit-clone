class Sub < ActiveRecord::Base
  attr_accessible :name, :user_id, :links_attributes, :link_ids

  #validates :name, presence: true

  has_many :links, :through => :link_subs
  has_many :link_subs
  belongs_to :user

  accepts_nested_attributes_for :links, reject_if: proc { |attributes| attributes['title'].blank? && attributes['url'].blank? }

end