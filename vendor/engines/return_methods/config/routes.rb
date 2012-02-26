::Refinery::Application.routes.draw do
  resources :return_methods, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :return_methods, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
