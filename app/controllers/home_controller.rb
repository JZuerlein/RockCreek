class HomeController < ApplicationController
  def index
    @plans = Plan.order("price")

    @eventlog = Eventlog.new
    @eventlog.when = Date.today
    @eventlog.ip =  request.remote_ip
    @eventlog.action = "Visited Home Page"
    @eventlog.controller = HomeController.to_s
    @eventlog.save

  end
end
