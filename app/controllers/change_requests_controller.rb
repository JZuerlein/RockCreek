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
    @change_request = current_resource

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @change_request }
    end
  end

  # GET /change_requests/new
  # GET /change_requests/new.json
  def new
    @change_request = ChangeRequest.new
    @change_request.status = "New"
    @change_request.requester_id = @current_user.id

    respond_to do |format|
      format.html #edit.html.erb
      format.json { render json: @change_request }
    end
  end

  # GET /change_requests/1/edit
  def edit
    @change_request = current_resource

    if params[:command] == "Approve"
      @change_request.approve(@current_user)
      redirect_to @change_request
    end

    if params[:command] == "Submit"
      @change_request.submit(@current_user)
      redirect_to @change_request
    end

    if params[:command] == "Deny"
      @change_request.deny(@current_user)
      redirect_to @change_request
    end

    if params[:command] == "Modify"
      @change_request.modify(@current_user)
    end

    if params[:command] == "Complete"
      @change_request.complete(@current_user)
      redirect_to @change_request
    end
  end

  def approve
    @change_request = current_resource
    @change_request.approve(@current_user)
    @change_request.save
  end

  # POST /change_requests
  # POST /change_requests.json
  def create
    @change_request = ChangeRequest.new(params[:change_request])

    @eventlog = Eventlog.new
    @eventlog.when = Date.today
    @eventlog.ip =  request.remote_ip
    @eventlog.action = "Created Change Request"
    @eventlog.controller = ChangeRequestsController.to_s
    @eventlog.user = @current_user.id
    @eventlog.save

    respond_to do |format|
      if @change_request.save

        #Add the ChangeResponses to the change request
        UserGroupAssignment.find_all_by_group_id(2).each do |user_group_assignment|
          @request_response = RequestResponse.new(:user_id => user_group_assignment.user_id, :change_request_id => @change_request.id)
          @request_response.save
        end

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
    @change_request = current_resource

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
    @change_request = current_resource      #change to current_resource
    @change_request.destroy

    respond_to do |format|
      format.html { redirect_to change_requests_url }
      format.json { head :no_content }
    end
  end

  def user_list
    User.find_all_by_tenant_id(Tenant.current_id)
  end

  def current_resource
    @current_resource ||= ChangeRequest.find(params[:id]) if params[:id]
  end
end
