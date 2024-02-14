class Article < ApplicationRecord
    validates :writer_name, presence: true, length:{minimum: 4}
    validates :title, presence: true
    validates :body, presence: true
end
