class GetSubject < ApplicationRecord
	belongs_to :subjects
	belongs_to :get_subject, polymorphic: true
end
