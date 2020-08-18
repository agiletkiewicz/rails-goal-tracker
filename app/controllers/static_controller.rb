class StaticController < ApplicationController

    def home
        render layout: "welcome"
    end

end