class Event < ApplicationRecord
	belongs_to :project
	has_many :get_subjects
end
