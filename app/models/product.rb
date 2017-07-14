class Product < ApplicationRecord
  belongs_to :product_category

  has_attached_file :image,
                    :styles => { small: "100x100", medium: "300x300#", thumb: "100x100#", zemel: "200x200#", normal: "400x400#", slide_gallery: "606x400#" },
                    :url => "/assets/product_photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/product_photos/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_size :image, :less_than => 5.megabytes
end
