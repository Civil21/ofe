class Project < ApplicationRecord
	has_many :events
	has_many :gets, as: :subject
end
