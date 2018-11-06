class SubjectsController < ApplicationController
    def index
      
      @subject =Subject.all 
    end
  
    def show
      
    end
  
    def new
  
    end
  
    def create
      @subject=Subject.create(subject_params)
        if @subject.save
        redirect_to root_path #test	
        else
          render 'new'
        end
    end
  
    def edit
  
    end
  
    def update
      @subject.update(subject_params)
        redirect_to root_path #test
    end
  
   
  private
    def subject_params
      params.require(:subject).permit(:name,:desc,:type)
    end
  
  
  end
  