class Board < ApplicationRecord

    validates :title, presence: true
    validates :title, length: { minimum: 3, maximum: 50}

    validates :content, presence: true
    validates :content, length: { minimum: 10, maximum: 3000 }

    belongs_to :user
end
