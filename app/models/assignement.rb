class Assignement < ApplicationRecord
	self.table_name = "assignements"
	belongs_to :category
	belongs_to :service
end
