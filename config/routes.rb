Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Homepages
  root 'home#logged_in'
  get 'authenticate', to: 'home#logged_out'
  resource :home, only: [:logged_in, :logged_out]
end
