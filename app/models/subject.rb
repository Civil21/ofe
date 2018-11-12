module Subject
	def profit_objects(type)
		return self.profits.where(object_type: type.to_s).collect{|subject| subject=subject.object}
	end

	def need_objects(type)
		return self.needs.where(object_type: type.to_s).collect{|subject| subject=subject.object}
	end
end