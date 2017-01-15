class Album < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :uploads, dependent: :destroy

end
