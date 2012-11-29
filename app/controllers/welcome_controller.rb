class WelcomeController < ApplicationController
  def index
    @locations = Location.find(:all)
  end

  def new

  end

end
