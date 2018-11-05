class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
  	before_action :check_content 

  	private

  	def check_content
  		if(user_signed_in? )
  			pp 1
  			if(!Content.where(user_id: current_user.id).first)
  				pp 2
  				redirect_to new_content_path
  			end
  		end
  	end
end
