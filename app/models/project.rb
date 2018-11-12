class Project < ApplicationRecord
	include Subject
	has_many :events
	has_many :profits, as: :subject
	has_many :needs, as: :subject
end
