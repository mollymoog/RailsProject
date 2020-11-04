class OutcropsController < ApplicationController

    def index
        @outcrops = Outcrop.all
    end

end