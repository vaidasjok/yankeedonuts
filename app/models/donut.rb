class Donut < ApplicationRecord
	has_attached_file :photo,
                    :styles => { small: "100x100", medium: "300x300#", thumb: "100x100#", zemel: "200x200#", normal: "400x400#", slide_gallery: "502x335#" },
                    :url => "/assets/menu/donuts/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/menu/donuts/:id/:style/:basename.:extension"
    validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
