class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /orders
  # GET /orders.json
  def index
    @clients = Client.all
    if current_user.role=="Admin" || current_user.role=="Transfer"
      if params[:created_at]
        @orders = Order.where(
          'created_at >= :today',
          :today  => Time.now - 1.days
        )
      else
        @orders = Order.all
      end
    elsif current_user.role=="Commerce" 
    if params[:created_at]
        @orders = Order.where(
          'created_at >= :today and commerce= :commerce',
          :today  => Time.now - 1.days, commerce: current_user.email
        )
      else
        @orders = Order.where(commerce: current_user.email)
      end
    elsif current_user.role=="Distributor" 
    if params[:created_at]
        @orders = Order.where(
          'created_at >= :today and distributor= :distributor',
          :today  => Time.now - 1.days, distributor: current_user.email
        )
      else
        @orders = Order.where(distributor: current_user.email)
      end
    else
      redirect_to home_index_url
    end
    
    
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
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
    @order.zone=current_user.zone
    @order.distributor=current_user.creator
    @order.commerce=current_user.email
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'La transacción se ha efectuado satisfatoriamente' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      @order.zone=current_user.zone
      if @order.voucher!=""
        @order.status="Exitoso"
      end
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
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
      params.require(:order).permit(:client_id, :value, :document, :name, :email, :city, :address, :phone, :account, :voucher, :created_at)
    end
end
