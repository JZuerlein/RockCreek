class HomeController < ApplicationController
  def index
    @plans = Plan.order("price")
  end
end
