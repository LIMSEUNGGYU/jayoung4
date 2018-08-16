class Person < ApplicationRecord
    has_many :contents, dependent: :destroy
    belongs_to :user
    mount_uploader :image, ImageUploader
end
