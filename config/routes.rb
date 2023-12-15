Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      # Devise configuration

      # devise_for :users
      
      resources :pokemons do
        member do
          get 'checkout', to: 'pokemons#checkout', as: :checkout
          post 'buy', to: 'pokemon#buy', as: :buy
          post 'sell', to: 'pokemon#sell', as: :sell
        end
      end
      
      get 'me', to: 'users#informations'
      patch 'me/add', to: 'users#add_money_to_balance'
      get 'me/transactions', to: 'users#transactions'
    end
  end
end
