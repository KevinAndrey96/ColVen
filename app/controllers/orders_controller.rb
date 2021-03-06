class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :cancel]
  layout "dashboard"
  # GET /orders
  # GET /orders.json
  def index
    
    
    @clients = Client.all
    if current_user.role=="Wholesaler" && params[:user]
      if params[:fecha]
        #@orders=Order.where(:commerce => params[:user], 'DATE(created_at) = :se_fech')
         @orders = Order.where(
          'DATE(created_at) = :fecha and commerce = :comercio_u',
          fecha: params[:fecha], comercio_u: params[:user]
          ).desc
      else
        @orders=Order.where(:commerce => params[:user])
      end
      
    elsif current_user.role=="Admin" || current_user.role=="Transfer"
      if params[:created_at]=="true"
        @orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, status: params[:status]
          
        ).desc
      elsif params[:status]
        @orders = Order.where(
          'status= :status',
          status: params[:status]
        ).desc
      else  
        @orders = Order.all.desc
        #@orders = @orders.paginate(:page => 1, :per_page => 20)
      end
      
      if params[:search] && params[:valor_se]
        if params[:search] == "Documento"
        @orders = Order.where(
          'document = :se_value',
           se_value: params[:valor_se]
          ).desc
        @orders = @orders.paginate(:page => 1, :per_page => 20)
        elsif params[:search] == "Nombre"
        @orders = Order.where(
          'name = :se_value',
          se_value: params[:valor_se]
          ).desc
        #@orders = @orders.paginate(:page => 1, :per_page => 20)
          
        elsif params[:search] == "Fecha"
        @orders = Order.where(
          'DATE(created_at) = :se_value',
          se_value: params[:valor_se]
          ).desc
        #@orders = @orders.paginate(:page => 1, :per_page => 20)
          
        end
      end
      
    elsif current_user.role=="Commerce" 
    if params[:created_at]
      #  @orders = Order.where(
       #   'created_at >= :today and commerce= :commerce',
        #  :today  => Time.now - 1.days, commerce: current_user.email
        #).desc
        #puts "fskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaf"
        @orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, :commerce => current_user.email, :status => params[:status])
      else
        #puts "fskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaffskadljkjdfsalkjñasdfkñldjasfñldasfjdfaslñjasdflñkdsaf"
        @orders = Order.where(commerce: current_user.email).desc
      end
    elsif current_user.role=="Distributor" 
    if params[:fecha] && params[:user]
        #@orders=Order.where(:commerce => params[:user], 'DATE(created_at) = :se_fech')
         @orders = Order.where(
          'DATE(created_at) = :fecha and commerce = :comercio_u',
          fecha: params[:fecha], comercio_u: params[:user]
          ).desc
      elsif params[:user]
       @orders=Order.where(:commerce => params[:user], :distributor => current_user.email)
    elsif params[:created_at]
        @orders = Order.where(
          'created_at >= :today and distributor= :distributor',
          :today  => Time.now - 1.days, distributor: current_user.email
        ).desc
        @orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, :distributor => current_user.email)
      else
        @orders = Order.where(distributor: current_user.email).desc
      end
    else
      redirect_to home_index_url
    end
    
    @orders = @orders.paginate(:page => 1, :per_page => 20).desc
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end
  
  def cancel
    #@order=Order.find(params[:id])
    #@order.status="Canceled"
    
    
    respond_to do |format|
      
     if @order.status=="Espera"
        @order.commentary="Cancelado"
        @order.status="Cancelado"
        @order.save
          format.html { redirect_to root_path, notice: 'El intercambio se ha cancelado satisfatoriamente.' }
          format.json { render :show, status: :ok, location: @order }
      else
        format.html { redirect_to @order, notice: 'El intercambio ya se realizó.' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    
    @order = Order.new(order_params)
    @order.client_id=Client.where(email: params[:client_email]).last.id
    @order.zone=current_user.zone
    @order.distributor=current_user.creator
    @order.commerce=current_user.email
    @order.wholesaler=User.where(:email => current_user.creator).first.creator
    @order.target_value=@order.value/Setting.last.exchange_rate
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'La transacción se ha efectuado satisfatoriamente' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, :cliente => params[:client_email] }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      @order.zone=current_user.zone
      if params[:voucher_check]
        @order.voucher="http://colvenintercambios.com/Vouchers/upload/"+ Digest::SHA1.hexdigest(@order.id.to_s) + ".jpg"
        @order.status="Exitoso"
      end
      if @order.update(order_params)
        if current_user.role!="Transfer"
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { redirect_to voucher_index_path("id": @order.id), notice: 'Order was successfully updated.' }
        end
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'La transacción se ha eliminado con exito' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:client_id, :value, :document, :name, :email, :city, :address, :phone, :account, :voucher, :created_at, :voucher_check, :status, :user, :bank, :commentary, :client_email, :type_account)
      #params.permit(:client_id, :value, :document, :name, :email, :city, :address, :phone, :account, :voucher, :created_at, :voucher_check, :status, :user, :bank, :commentary)
      #params.permit(:order, :client_id, :value, :document, :name, :email, :city, :address, :phone, :account, :voucher, :created_at, :voucher_check) este no
    end
end
