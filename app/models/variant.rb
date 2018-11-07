class Variant < ApplicationRecord
	has_many :gets, as: :subject
end
