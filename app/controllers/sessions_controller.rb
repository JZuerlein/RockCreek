class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if (session[:user_id] != nil)
        puts "SESSIONSCONTROLLER-CREATE session[:user_id] = " + session[:user_id].to_s
      else
        puts "SESSIONSCONTROLLER-CREATE session[:user_id] = nil"
      end

      if (user != nil)
        puts "SESSIONSCONTROLLER-CREATE user = " + user.id.to_s
      else
        puts "SESSIONSCONTROLLER-CREATE user = nil"
      end


      puts "Ready to redirect to subdomain. " + root_url(:subdomain =>user.tenant.subdomain) + "dashboard/show.html"
      redirect_to root_url(:subdomain => user.tenant.subdomain) + "dashboard/show.html"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url(:host => request.domain), :notice => "Logged out!"
  end
end
