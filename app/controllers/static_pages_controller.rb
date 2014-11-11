class StaticPagesController < ApplicationController

  def index
    @trips = Trip.all
  end
end
