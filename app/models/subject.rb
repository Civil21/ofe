module Subject
	def items
		return self.profits.where(object_type: "Item").collect{|item| item=item.object}
	end

	def status
		self.profits.each{|item|
			item=item.object
		}
	end

	def objects(type)
		return self.profits.where(object_type: type.to_s).collect{|subject| subject=subject.object}
	end
end