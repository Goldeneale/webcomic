class Panel < ActiveRecord::Base
    has_attached_file :image, default_url: "/images/fatal-error.png"
    validates :title, presence: true
    validates :page, presence: true
    validates :width, presence: true
    validates :height, presence: true
    validates_attachment :image, presence: true,
        content_type: { content_type: ["image/jpeg", "image/png"] }
end
