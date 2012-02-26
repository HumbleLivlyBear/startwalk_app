StartwalkApp::Application.routes.draw do
  devise_for :partners, :controllers => {
        :registrations => "registrations",
        :omniauth_callbacks => "users/omniauth_callbacks"
      } do
        get "logout" => "devise/sessions#destroy"
      end
  
  match 'pages/login'
  
  match 'projects/:id/support' => 'Projects#support', :as => :project_support
end
