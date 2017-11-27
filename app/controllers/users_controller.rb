class UsersController < ApplicationController
  before_action:set_user, only: [:create,:show, :edit, :update, :destroy]
    layout "dashboard"
  def index
    if params[:role]=="All" && current_user.role=="Admin"
      @users = User.all
    elsif current_user.role=="Admin"
      #@users= User.all
      @users= User.where(role: params[:role])
    elsif current_user.role=="Commerce" || current_user.role=="Wholesaler" || current_user.role=="Distributor"
      @users= User.where(role: params[:role], creator: params[:creator])
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
  @user.password="123456"
  @user.password_confirmation="123456"
  @user.creator=current_user.email
  
  if current_user.role=="Commerce"
    @user.role="Distributor"
    @user.zone=current_user.zone
  end
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
        params.require(:user).permit(:email, :role, :zone, :commission)
      
    end

end