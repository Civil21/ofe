class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_subject, except:[:new,:create,:index]
  before_action :thisUser,except:[:index]

    def index    
      @subjects =Subject.all 
    end
  
  
    def new
  
    end
  
    def create
      @subject=Subject.create(subject_params)
      if @subject.save
        redirect_to subjects_path 
      else
        render 'new'
      end
    end
  
    def edit
  
    end
  
    def update
      @subject.update(subject_params)
      redirect_to subjects_path
    end
  
   
  private

    def subject_params
      params.require(:subject).permit(:name,:desc)
    end

    def get_subject
      @subject = Subject.find(params[:id])
    end
  
  
  end
  