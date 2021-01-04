class StatisticvisitorsController < ApplicationController
  before_action :authenticate_username!

  def index
    @statisticvisitors  = Statisticvisitor.all
    $all_statistic_visitors = Redis.new
  end
  def destroy
    @statisticvisitor = Statisticvisitor.find(params[:id])
    @statisticvisitor.destroy
    redirect_to '/topics/'
  end

  private
  def statisticscreator_params
    params.require(:statisticvisitor).permit(:idregvis, :idreg, )
  end
end
