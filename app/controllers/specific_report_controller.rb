class SpecificReportController < ApplicationController
  layout "dashboard"
  def index
    case current_user.role
    when "Admin"
      @comercios=User.where(:users => { :role => "Commerce"})
    when "Distributor"
      @comercios=User.where(:users => { :role => "Commerce", :creator => current_user.email})
    when "Wholesaler"
      if params[:role]=="Distributor"
        @comercios=User.where(:users => {:creator => params[:user]})
      else
        @comercios=User.where(:users => { :role => "Distributor", :creator => current_user.email})
      end
      
    end
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
        params.require(:user).permit(:role)
    end
end
