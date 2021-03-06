Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/deconnexion', to: 'accueil#logout', as: 'logout'
  get  '/connexion',   to: 'accueil#login', as: 'login'
  post '/connexion',  to: 'accueil#login'

  # get '/demandes',     to: 'demandes#index'
  resources :demandes
  # get '/demande/new',     to: 'demande#new', as: 'demande_new'
  # get '/demande/edit',     to: 'demande#edit', as: 'demande_edit'
  get '/admin/demandes', to: 'admin#index', as: 'admin_demande'
  get '/admin/demandes/valider/:id_demande', to: 'admin#valider', as: 'valider_demande'
  post '/admin/demandes/refuser', to: 'admin#refuser', as: 'refuser_demande'
  get '/admin/demandes/show/:id_demande', to: 'admin#show', as: 'show_demande'
  root to: 'accueil#index'
end
