Rails.application.routes.draw do
  root 'logic#input'

  get 'result' => 'logic#result'
end
