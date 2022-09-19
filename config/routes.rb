Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users do
        resources :memos do
          resources :replies
        end
      end
    end
  end
end
