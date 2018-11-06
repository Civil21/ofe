class Content < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :subjects
	has_and_belongs_to_many :statuses
end
