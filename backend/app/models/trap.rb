class Trap < ApplicationRecord
    belongs_to :property
    has_many :entries
end
