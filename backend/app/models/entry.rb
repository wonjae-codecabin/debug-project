class Entry < ApplicationRecord
  belongs_to :trap
  has_one_attached :image
end
