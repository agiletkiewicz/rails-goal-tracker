class User < ApplicationRecord
    has_many :goals 
    has_many :tasks, through: :goals
    has_many :notes, through: :goals 
    
end
