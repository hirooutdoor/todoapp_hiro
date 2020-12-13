class Board < ApplicationRecord

    validates :title, presence: true
    validates :title, length: { minimum: 3, maximum: 30}

    validates :content, presence: true
    validates :content, length: { minimum: 10, maximum: 3000 }

    belongs_to :user

    has_many :tasks

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    def author_name
        user.display_name
    end

end
