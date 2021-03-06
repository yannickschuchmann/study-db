Rails.application.routes.draw do
  get 'settings/:name' => 'settings#set'

  get 'cases/test', as: :test_case
  get 'cases/answer', as: :answer_case
  get 'cases/tested', as: :tested_case
  post 'cases/answered', as: :answered_case
  get 'cases/handle', as: :handle_case

  get 'cases/:case_id/:sheet_number' => 'cases#debug', as: :debug_case
  get 'questionaries/:name' => 'questionaries#debug', as: :debug_questionary

  get 'completed' => 'content#completed', as: :completed

  get 'participants/new', as: :new_participant
  post 'participants/create', as: :create_participant

  root 'content#intro'
  get 'instructions' => 'content#instructions'

  namespace :backend do
    root to: "participants#index", as: :root
    get 'participants/index'
    get 'participants/comments' => 'participants#export_comments', as: :export_comments
    get 'participants/:id' => 'participants#show', as: :participant
    post 'participants/export', as: :export
  end
end
