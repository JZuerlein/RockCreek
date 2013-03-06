class RequestResponseController < ApplicationController

  def edit
    @request_response = RequestResponse.find(params[:id])
    @request_response.response = params[:response]

    if @request_response.save
      redirect_to root_url + "/dashboard"
    end
  end
end
