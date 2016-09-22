Rails.application.routes.draw do
  resources :posts do
    collection do
      post :order
    end

    member do
      post :file, controller: "posts/filings"
    end
  end

  root to: "posts#index"
end
