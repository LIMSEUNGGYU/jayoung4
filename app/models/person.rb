class Person < ApplicationRecord
    has_many :contents, dependent: :destroy
    belongs_to :user
    
    # paginates_per 2
    
    mount_uploader :image, ImageUploader
    
    validates :name, presence: true 
    validates :phone, presence: true 
    
    searchable do
        text :name, :phone, :relation
    end

end
