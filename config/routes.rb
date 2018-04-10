Rails.application.routes.draw do
  # Homepages
  root 'home#logged_out'
  resource :home, :controller => 'home' do
    get :logged_in, :logged_out, :logged_in_admin, :demo_team, :vote_team
  end
end
