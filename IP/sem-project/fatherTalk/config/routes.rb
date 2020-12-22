# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
	scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
	  root 'home#index'

	  get 'ask' => 'home#add_question'
	  post 'ask' => 'home#add_question'
	  get 'question/:qid' => 'home#question_page'
	  get 'question' => 'home#index'
	  post 'question' => 'home#question_page'
	  
	  resources :users
	  resources :sessions, only: [:new, :create, :destroy]
	  get 'signup', to: 'users#new', as: 'signup'
	  get 'login', to: 'sessions#new', as: 'login'
	  get 'logout', to: 'sessions#destroy', as: 'logout'
	end
end
