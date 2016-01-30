Rails.application.routes.draw do
  get 'cases/test', as: :test_case
  get 'cases/handle', as: :handle_case
  get 'cases/answer', as: :answer_case

  get 'participants/new', as: :new_participant
  post 'participants/create', as: :create_participant

  root 'intro#index'
end
