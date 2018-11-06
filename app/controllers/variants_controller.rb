class VariantsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_variant, except:[:new,:create,:index]
	before_action :thisUser

	def index
		@variants =Variant.all 
		@get_subjects = []
		@variants.each{|variant|
			@get_subjects[variant.id]=get_subjects(variant)
		}
	end

	def new
		# для виобру проекта якому належать, можливо потрібно буде перенести у форму, але так буде правильніше
		@events = Event.all
		@variants =Variant.all 
		@subjects =Subject.all
	end

	def create
		if(params[:variant][:belongs_event])
			params[:variant][:variant_id]= nil
		else
			params[:variant][:event_id]= nil
		end
		@variant=Variant.create(variant_params)
		@subjects= Subject.find_by(id: params[:variant][:get_subjects])
		pp @subjects
  		if @variant.save
  			add_get(@variant,@subjects)
			redirect_to variants_path	
    	else
  			render 'new'
  		end
	end

	def edit
		@events = Event.all
		@variants =Variant.all 
		@subjects =Subject.all
	end

	def update
		if(params[:variant][:belongs_event])
			params[:variant][:variant_id]= nil
		else
			params[:variant][:event_id]= nil
		end
		@variant.update(variant_params)
  		redirect_to variants_path
	end

	private

	def get_subjects(object)
		return GetSubject.where(get_subject_type: object.class.name, get_subject_id: object.id)
	end

	def add_get(object,subjects)
		GetSubject.where(get_subject_type: object.class.name, get_subject_id: object.id).each{|subject|
			subject.delete
		}
		if subjects != nil
			subjects.each{|subject|
				GetSubject.create(subject_id: subject.id, get_subject_type: object.class.name, get_subject_id: object.id)
			}
		end
	end

	def get_variant
		@variant = Variant.find(params[:id])
	end

	def variant_params
		params.require(:variant).permit(:name,:desc,:event_id,:variant_id)
	end

end
