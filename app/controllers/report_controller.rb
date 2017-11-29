class ReportController < ApplicationController
  layout "dashboard"
  def index
    
    if current_user.role!="Admin" && current_user.role!="Distributor" && current_user.role!="Wholesaler"
      redirect_to home_index_url
    end
    case current_user.role
    when "Admin"
      @comercios=User.where(:users => { :role => "Commerce"})
    when "Distributor"
      @comercios=User.where(:users => { :role => "Commerce", :creator => current_user.email})
    when "Wholesaler"
      @comercios=User.where(:users => { :role => "Distributor", :creator => current_user.email})
    end
    
    
  end
end
