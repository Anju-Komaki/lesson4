Rails.application.routes.draw do
root :to => 'books#index'
get 'books' => 'books#new' ,as:'books'
get 'books/:id' => 'books#show', as:'book'
delete 'books/:id' => 'books#destroy', as:'destroy_book'
get 'books/:id/edit' => 'books#edit', as: 'edit_book'
resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
