class EventsController < 	ApplicationController
	before_action :authenticate_user!
	before_action :get_event, except:[:new,:create,:index]
	before_action :thisUser

	def index
		@events =Event.all 
	end

	def new
		# для виобру проекта якому належать, можливо потрібно буде перенести у форму, але так буде правильніше
		@projects = Project.all
	end

	def create
		@event=Event.create(event_params)
  		if @event.save
			redirect_to events_path	
    	else
  			render 'new'
  		end
	end

	def edit

	end

	def update
		@event.update(event_params)
  		redirect_to events_path
	end

	private

	def get_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name,:desc,:project_id)
	end
end
