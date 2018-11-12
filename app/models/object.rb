module Object
	def profit_subjects(type)
		return self.profits.where(subject_type: type.to_s).collect{|object| object=object.subject}
	end
end