class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :title, presence: true,
                        length: {minimum: 5}
    validates :text, presence: true, length: { minimum: 10, maximum: 100 }

    belongs_to :user
    validates :user_id, presence: true
end
