class VariantsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_variant, except:[:new,:create,:index]
	before_action :thisUser

	def index
		@variants =Variant.all 
		@profit_items = []
		@profit_statuses = []
		@need_items=[]
		@need_statuses= []
		@variants.each{|variant|
			@profit_items[variant.id]= variant.profit_objects("Item")
			@profit_statuses[variant.id]=variant.profit_objects("Status")
			@need_items[variant.id]= variant.need_objects("Item")
			@need_statuses[variant.id]=variant.need_objects("Status")
		}
	end

	def new
		# для виобру проекта якому належать, можливо потрібно буде перенести у форму, але так буде правильніше
		@events = Event.all
		@variants =Variant.all 
		@items =Item.all
		@statuses = Status.all
	end

	def create
		if(params[:variant][:belongs_event])
			params[:variant][:variant_id]= nil
		else
			params[:variant][:event_id]= nil
		end
		@variant=Variant.create(variant_params)

		@profit_items= Item.where(id: params[:variant][:profit_items])
		@profit_statuses= Status.where(id: params[:variant][:profit_statuses])

		@need_items= Item.where(id: params[:variant][:need_items])
		@need_statuses= Status.where(id: params[:variant][:need_statuses])

  		if @variant.save
  			@profit_items.each{|item|
			Profit.create(object: item, subject: @variant)
			}
  			@profit_statuses.each{|status|
			Profit.create(object: status, subject: @variant)
			}

  			@need_items.each{|item|
			Need.create(object: item, subject: @variant)
			}
  			@need_statuses.each{|status|
			Need.create(object: status, subject: @variant)
			}

			redirect_to variants_path	
    	else
  			render 'new'
  		end
	end

	def edit
		@events = Event.all
		@variants =Variant.all 
		@items =Item.all
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
