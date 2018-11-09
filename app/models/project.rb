class Project < ApplicationRecord
	has_many :events
	has_many :profits, as: :subject
end
