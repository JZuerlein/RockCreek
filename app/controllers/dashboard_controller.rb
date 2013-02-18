class DashboardController < ApplicationController

  def show
    @change_requests = ChangeRequest.all

    respond_to do |format|
      format.html # showhtml.erb
      format.json { render json: @change_requests }
    end
  end

end
