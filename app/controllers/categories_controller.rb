class CategoriesController < ApplicationController
    has_many :goals 
    has_many :users, through: :categories
    
end
