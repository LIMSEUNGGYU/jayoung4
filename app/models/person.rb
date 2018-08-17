class Person < ApplicationRecord
    has_many :contents, dependent: :destroy
    belongs_to :user
    mount_uploader :image, ImageUploader
    validates :name, presence: true 
    validates :phone, presence: true 
    validates :image, presence: true

end
