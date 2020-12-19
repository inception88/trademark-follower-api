class Trademark < ApplicationRecord
        has_many :follows
        has_many :users, through: :follows
end
