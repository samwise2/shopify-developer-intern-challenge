class Graphic < ApplicationRecord
    has_one_attached :image, :dependent => :destroy
    validates :title, presence: true
    validates :description, presence: true
    validates :image, presence: true, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
