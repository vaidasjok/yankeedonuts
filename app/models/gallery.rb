class Gallery < ApplicationRecord
  has_many :photos, :dependent => :destroy
end
