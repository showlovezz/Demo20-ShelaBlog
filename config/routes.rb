Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 設定首頁
  root "blog/posts#index"
  # 設定功能路由
  scope module: "blog" do
    resources :posts
    get "about" => "pages#about", as: :about
    get "contact" => "pages#contact", as: :contact
  end



end
