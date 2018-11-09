class Event < ApplicationRecord
	belongs_to :project
	has_many :profits, as: :subject
end
