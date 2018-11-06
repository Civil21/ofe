class VariantsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_variant, except:[:new,:create,:index]
	before_action :thisUser

	def index
		@variants =Variant.all 
	end

	def new
		# для виобру проекта якому належать, можливо потрібно буде перенести у форму, але так буде правильніше
		@events = Event.all
		@variants =Variant.all 
	end

	def create
		if(params[:variant][:belongs_event])
			params[:variant][:variant_id]= nil
		else
			params[:variant][:event_id]= nil
		end
		@variant=Variant.create(variant_params)
  		if @variant.save
			redirect_to variants_path	
    	else
  			render 'new'
  		end
	end

	def edit

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

	def get_variant
		@variant = Variant.find(params[:id])
	end

	def variant_params
		params.require(:variant).permit(:name,:desc,:event_id,:variant_id)
	end

end
