Rails.application.routes.draw do

  get "test_gem/index"
  mount Feedshub::Engine => "/feedshub"
end
