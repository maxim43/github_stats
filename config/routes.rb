Rails.application.routes.draw do
  namespace :api do
    resource :users_statistics do
      get :index
    end
  end
end
