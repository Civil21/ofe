class Variant < ApplicationRecord
	include Subject
	has_many :profits, as: :subject
end
