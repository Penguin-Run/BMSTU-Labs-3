Rails.application.routes.draw do
  root 'io_manager#input'

  get 'result' => 'io_manager#result'
end
