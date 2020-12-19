class Task < ApplicationRecord
    has_one_attached :eyecatch

    has_many :comments, dependent: :destroy

    belongs_to :user
    belongs_to :board

    def author_name
        user.display_name
    end

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

end
