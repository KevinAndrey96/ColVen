class HomeController < ApplicationController
  layout "dashboard"
  def index
    @setting = Setting.last
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_setting
    @setting = Setting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def setting_params
    params.require(:setting).permit(:colombian_currency)
  end
end