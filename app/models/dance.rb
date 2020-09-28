class Dance < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :title, :introduce, :price, :reservation_time, :genre, presence: true

  validates :genre_id, numericality: { other_than: 1 } 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
end
