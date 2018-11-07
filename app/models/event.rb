class Event < ApplicationRecord
	belongs_to :project
	has_many :gets, as: :subject
end
