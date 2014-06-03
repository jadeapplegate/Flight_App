Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'flights#new'

  get '/profile', to: 'users#profile', as: 'profile'
  
  resources :contacts, only: [:new, :create, :show, :edit, :update]

  resources :flights, only: [:new, :create, :edit, :update]

end

#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                     root GET    /                              flights#new
#                  profile GET    /profile(.:format)             users#profile
#                 contacts POST   /contacts(.:format)            contacts#create
#              new_contact GET    /contacts/new(.:format)        contacts#new
#             edit_contact GET    /contacts/:id/edit(.:format)   contacts#edit
#                  contact GET    /contacts/:id(.:format)        contacts#show
#                          PATCH  /contacts/:id(.:format)        contacts#update
#                          PUT    /contacts/:id(.:format)        contacts#update
#                  flights POST   /flights(.:format)             flights#create
#               new_flight GET    /flights/new(.:format)         flights#new
#              edit_flight GET    /flights/:id/edit(.:format)    flights#edit
#                   flight PATCH  /flights/:id(.:format)         flights#update
#                          PUT    /flights/:id(.:format)         flights#update

