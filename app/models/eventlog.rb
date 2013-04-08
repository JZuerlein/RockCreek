class Eventlog < ActiveRecord::Base
  attr_accessible :action, :controller, :ip, :user, :when
end
