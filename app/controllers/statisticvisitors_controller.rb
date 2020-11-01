class StatisticvisitorsController < ApplicationController
  def index
    @statisticvisitors  = Statisticvisitor.all
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
