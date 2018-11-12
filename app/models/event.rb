class Event < ApplicationRecord
	include Subject
	belongs_to :project
	has_many :profits, as: :subject
	has_many :needs, as: :subject
end
