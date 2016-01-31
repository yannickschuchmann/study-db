Rails.application.routes.draw do
  get 'cases/test', as: :test_case
  get 'cases/answer', as: :answer_case
  get 'cases/tested', as: :tested_case
  post 'cases/answered', as: :answered_case
  get 'cases/handle', as: :handle_case

  get 'completed' => 'content#completed', as: :completed
  get 'participants/feelings', as: :feelings_participant
  post 'participants/create_feelings', as: :create_feelings_participant

  get 'participants/new', as: :new_participant
  post 'participants/create', as: :create_participant

  root 'content#intro'
end
