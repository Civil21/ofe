class StatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_status, except:[:new,:create,:index]
  before_action :thisUser,except:[:index]

    def index
      @statuses =Status.all 
    end
  
    def show
      
    end
  
    def new
  
    end
  
    def create
      @status=Status.create(status_params)
      if @status.save
        redirect_to statuses_path 
      else
        render 'new'
      end
    end
  
    def edit
  
    end
  
    def update
      @status.update(status_params)
        redirect_to statuses_path 
    end
  
   
  private
    def status_params
      params.require(:status).permit(:name,:desc)
    end

    def get_status
      @status=Status.find(params[:id])
    end
  
  
  end
  