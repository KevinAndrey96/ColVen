class VoucherController < ApplicationController
    layout "dashboard"
  def index
    @order = Order.find(params[:id])
  end
  def voucher_params
      params.require(:voucher).permit(:id)
    end
end
