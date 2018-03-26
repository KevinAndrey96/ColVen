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
      if params[:role]=="Commerce"
        redirect_to orders_url(:user => params[:user])
      elsif params[:action_param]=="Specific"
        @comercios=User.where(:users => { :creator => params[:user]})
      else
        @comercios=User.where(:users => { :role => "Distributor", :creator => current_user.email})
      end
      
    end
    
    
  end
  private
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
        params.require(:user).permit(:action_param)
      
    end

end
