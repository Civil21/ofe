Rails.application.routes.draw do
  devise_for :users
	root to:"pages#index"

	resources :contents, except:[:index,:delete]
	resources :projects
	resources :events,except:[:show]
	resources :variants,except:[:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
