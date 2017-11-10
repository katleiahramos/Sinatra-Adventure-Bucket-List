class CategoriesController < ApplicationController
  before '/categories/*' do
    if !is_logged_in?
      flash[:login] = "You need to be logged in to performance that action"
      redirect to '/login'
    end
  end

  get '/categories' do
    if !is_logged_in?
      flash[:login] = "You need to be logged in to performance that action"
      redirect to '/login'
    end
    erb :"categories/categories"
  end

  get '/all_categories' do
    erb :"categories/all_categories"
  end

  get '/categories/:id' do
    @category = Category.find(params["id"])
    erb :"categories/show"
  end
end
