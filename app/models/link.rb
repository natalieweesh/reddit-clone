class Link < ActiveRecord::Base
  attr_accessible :title, :url, :text, :user_id, :sub_ids

  validates :title, :url, presence: true

  has_many :link_subs
  has_many :subs, :through => :link_subs
  belongs_to :user

  accepts_nested_attributes_for :subs


end