class Task < ApplicationRecord

    belongs_to :user
    belongs_to :board

    def author_name
        user.display_name
    end

end
