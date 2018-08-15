class Person < ApplicationRecord
    has_many :contents, dependent: :destroy
    belongs_to :user
end
