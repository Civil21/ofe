class Project < ApplicationRecord
	has_many :events
	has_many :get_subjects
end
