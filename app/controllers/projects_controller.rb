class ProjectsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_project, except:[:new,:create,:index]
	before_action :thisUser,except:[:index,:show]

	def index
		#потрібно юуде написати код який буде визначати доступні локації на основі наявних предметів, статусів.
		@projects =Project.all 
	end

	def show

	end

	def new

	end

	def create
		@project=Project.create(project_params)
  		if @project.save
			redirect_to project_path(@project.id)	
    	else
  			render 'new'
  		end
	end

	def edit

	end

	def update
		@project.update(project_params)
  		redirect_to project_path(@project.id)
	end

	private

	def get_project
		@project = Project.find_by(id: params[:id])
		@project ||= Project.find_by(name: params[:id])
	end

	def project_params
		params.require(:project).permit(:name,:desc)
	end

	def thisUser
		if(current_user.id != 1)
			redirect_to root_path 
		end
	end

end
