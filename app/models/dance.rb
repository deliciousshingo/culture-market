class Dance < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :title, :introduce, :price, :reservation_time, :genre, presence: true

  validates :genre_id, numericality: { other_than: 1 } 
end
