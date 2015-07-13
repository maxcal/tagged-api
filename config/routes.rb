Rails.application.routes.draw do

  use_doorkeeper
  namespace :api, module: "tagged/api" do
    namespace :v1 do
      resources :users, except: [:new, :edit]
    end
  end
end
