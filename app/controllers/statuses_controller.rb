class StatusesController < ApplicationController
 
    def index
      
      @status =Status.all 
    end
  
    def show
      
    end
  
    def new
  
    end
  
    def create
      @status=Status.create(status_params)
        if @status.save
        redirect_to proot_path #test	
        else
          render 'new'
        end
    end
  
    def edit
  
    end
  
    def update
      @status.update(status_params)
        redirect_to root_path #test
    end
  
   
  private
    def status_params
      params.require(:status).permit(:name,:desc,:type)
    end
  
  
  end
  