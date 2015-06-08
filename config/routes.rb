Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :answer_sheets
  resources :time_infos
  root to: 'static_pages#home'

  namespace :admin do
    resources :users
  end

  namespace :examiner do
    resources :level_categories
    resources :questions
    resources :type_questions
    resources :exam_questions
    resources :examinations
    resources :session_examinations
    resources :user_session_exams
    resources :update_status_session_exams
    resources :categories
    resources :relationships, only: [:show, :update]
  end
end
