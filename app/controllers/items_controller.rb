class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item, except:[:new,:create,:index]
  before_action :thisUser,except:[:index]

    def index    
      @items =Item.all 
    end
  
  
    def new
  
    end
  
    def create
      @item=Item.create(item_params)
      if @item.save
        redirect_to items_path 
      else
        render 'new'
      end
    end
  
    def edit
  
    end
  
    def update
      @item.update(item_params)
      redirect_to items_path
    end
  
   
  private

    def item_params
      params.require(:item).permit(:name,:desc)
    end

    def get_item
      @item = item.find(params[:id])
    end
  
  
  end
  