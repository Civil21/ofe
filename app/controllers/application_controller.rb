class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
  	before_action :check_content

  	def thisUser
		if(current_user.id != 1)
			redirect_to root_path 
		end
	end 

  	private

  	def check_content
  		if(user_signed_in? )
  			if(!Content.where(user_id: current_user.id).first)
  				redirect_to new_content_path
  			end
  		end
  	end


end
