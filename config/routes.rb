LearnToProgram::Application.routes.draw do
  match('/', {:via => :get, :to => 'lessons#index'})
  match('lessons', {:via => :get, :to => 'lessons#index'})
  match('lessons', {:via => :post, :to => 'lessons#create'})
  match('lessons/:number', {:via => :get, :to => 'lessons#show'})
  match('lessons/:number/edit', {:via => :get, :to => 'lessons#edit'})
  match('lessons/:number', {:via => [:patch, :put], :to => 'lessons#update'})
  match('lessons/:number', {:via => :delete, :to => 'lessons#destroy'})
end
