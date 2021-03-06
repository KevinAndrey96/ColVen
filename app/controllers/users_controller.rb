class UsersController < ApplicationController
  before_action:set_user, only: [:create,:show, :edit, :update, :destroy, :delete]
    layout "dashboard"
  def index
    if params[:role]=="All" && current_user.role=="Admin"
      @users = User.all
    elsif current_user.role=="Admin"
      #@users= User.all
      @users= User.where(role: params[:role])
    elsif current_user.role=="Commerce" || current_user.role=="Wholesaler" || current_user.role=="Distributor"
      if params[:se_action] && params[:se_value]
        if params[:se_action]=="search" && current_user.role=="Distributor"
          @variable=params[:se_value]
          @users= User.where("name LIKE :se_value and role = :role and creator = :creator", se_value: "%#{params[:se_value]}%",  role: params[:role], creator: current_user.email)
        elsif params[:se_action]=="search" && current_user.role=="Wholesaler"
          @users= User.where("name LIKE :se_value and role = :role and creator = :creator", se_value: "%#{params[:se_value]}%", role: params[:role], creator: params[:creator])
        else
          @users= User.where(role: params[:role], creator: params[:creator])
        end
      else
        @users= User.where(role: params[:role], creator: params[:creator])
      end
    else
      redirect_to home_index_url
    end
  
            
  end
  
  def new
  @user= User.new
  end
  
  def show
    @users= User.find(params[:id])
  end
  
  def edit
    @user= User.find(params[:id])
  end
  
  def create
  @user= User.new(user_params)
  @user.password="Colven2018@"
  @user.password_confirmation="Colven2018@"
  @user.creator=current_user.email
  #@user.zone=current_user.zone
    respond_to do |format|
      if @user.save
  format.html { redirect_to @user, notice: 'El Usuario se ha creado satisfactoriamente' }
  format.json { render:show, status: :created, location: @user }
      else
  format.html { render:new }
  format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  
  end
   
    def update
    respond_to do |format|
    @user= User.find(params[:id])
    #@user.password="Colven2018@"
    #@user.password_confirmation="Colven2018@"
      if @user.update(user_params)
  format.html { redirect_to @user, notice: 'El Usuario se ha actualizado satisfactoriamente' }
  format.json { render:show, status: :ok, location: @user }
      else
  format.html { render:edit }
  format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
    def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id]==""
        @user= User.find(params[:id])
      else
        @user=User.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:email, :role, :zone, :commission, :name, :phone, :identification, :se_action, :se_value)
      
    end

end