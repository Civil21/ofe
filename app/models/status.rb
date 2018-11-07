class Status < ApplicationRecord
	has_and_belongs_to_many :contents
		has_many :gets, as: :object
end
