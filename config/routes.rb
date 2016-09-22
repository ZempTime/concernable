Rails.application.routes.draw do
  resources :posts do
    collection do
      post :order
    end
  end

  root to: "posts#index"
end
