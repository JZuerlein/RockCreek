class ChangeRequestsController < ApplicationController
  # GET /change_requests
  # GET /change_requests.json
  def index
    @change_requests = ChangeRequest.all

    respond_to do |format|
      format.html # show.html.erb      format.json { render json: @change_requests }
    end
  end

  # GET /change_requests/1
  # GET /change_requests/1.json
  def show
    @change_request = ChangeRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @change_request }
    end
  end

  # GET /change_requests/new
  # GET /change_requests/new.json
  def new
    @change_request = ChangeRequest.new

    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @change_request }
    end
  end

  # GET /change_requests/1/edit
  def edit
    @change_request = ChangeRequest.find(params[:id])
  end

  # POST /change_requests
  # POST /change_requests.json
  def create
    @change_request = ChangeRequest.new(params[:change_request])

    respond_to do |format|
      if @change_request.save
        format.html { redirect_to @change_request, notice: 'Change request was successfully created.' }
        format.json { render json: @change_request, status: :created, location: @change_request }
      else
        format.html { render action: "new" }
        format.json { render json: @change_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /change_requests/1
  # PUT /change_requests/1.json
  def update
    @change_request = ChangeRequest.find(params[:id])

    respond_to do |format|
      if @change_request.update_attributes(params[:change_request])
        format.html { redirect_to @change_request, notice: 'Change request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @change_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_requests/1
  # DELETE /change_requests/1.json
  def destroy
    @change_request = ChangeRequest.find(params[:id])
    @change_request.destroy

    respond_to do |format|
      format.html { redirect_to change_requests_url }
      format.json { head :no_content }
    end
  end

  def user_list
    User.find_all_by_tenant_id(Tenant.current_id)
  end
end
