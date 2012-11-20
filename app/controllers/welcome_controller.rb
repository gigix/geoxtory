class WelcomeController < ApplicationController
  def index
    @trips = Trip.find(:all)
  end

  def new

  end

end
