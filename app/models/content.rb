class Content < ApplicationRecord
  belongs_to :person
  belongs_to :user
  # self.per_page = 3
  
  validates :inout, presence: true
  validates :category, presence: true
  validates :date, presence: true
  
end
