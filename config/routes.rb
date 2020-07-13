Rails.application.routes.draw do
  namespace :api do
    api_version(
        module: 'V1',
        path: { value: 'v1' },
        defaults: { format: :json }
    ) do

      resources :schools, except: :show do
        get :summary, on: :collection
      end

      get :swagger, to: 'swagger#json'


      scope :diagnostics, controller: :diagnostics do
        get :exception
        get 'status_code/:status_code', action: :status_code
        get :me
      end
    end
  end

    #match '*path', via: :all, to: 'application#error_404'
end