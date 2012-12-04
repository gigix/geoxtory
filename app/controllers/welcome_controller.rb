class WelcomeController < ApplicationController
  def index
    @trip = Trip.first
  end

  def new

  end

end
