Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index' #Pagina principal
  resources :users	#Declaramos usuarios como un recurso para hacer el CRUD mas facil
end
