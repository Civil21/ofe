class ContentsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_content, except:[:new,:create]
	before_action :check_content, only:[:new,:create]
	before_action :thisUser, only:[:edit,:update]

	def show
		
	end

	def new
	end

	def create
		params[:content][:user_id]=current_user.id
		@content=Content.create(content_params)
  		if @content.save
			redirect_to content_path(@content.id)	
    	else
  			render 'new'
  		end
	end

	def edit

	end

	def update
		@content.update(content_params)
  		redirect_to content_path(@content.id)
	end

	private

	def get_content
		@content = Content.find(params[:id])
	end

	def content_params
		params.require(:content).permit(:name,:user_id)
	end

	def thisUser
		if(current_user.id != @content.user.id)
			redirect_to content_path(current_user.content.id) 
		end
	end

	def check_content

	end
end
