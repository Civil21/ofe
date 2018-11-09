class Item < ApplicationRecord
	has_and_belongs_to_many :contents
	has_many :profits, as: :object
end
